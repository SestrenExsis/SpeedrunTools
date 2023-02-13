'''
@created: 2021-06-10
@author: Sestren
'''

import argparse
from cv2 import cv2
import os

def get_time_code(time_in_ms: int=0) -> str:
    hours, rem = divmod(time_in_ms, 60 * 60 * 1000)
    minutes, rem = divmod(rem, 60 * 1000)
    seconds, milliseconds = divmod(rem, 1000)
    hours = int(hours)
    minutes = int(minutes)
    seconds = int(seconds)
    time_code = '{:0>1}h {:0>2}m {:0>2}s {:0>3}ms'.format(
        hours,
        minutes,
        seconds,
        milliseconds,
        )
    result = time_code
    return result

def get_time_in_ms(time_code: str='0h 00m 00s 000ms') -> int:
    time_in_ms = 0
    time_components = time_code.split(' ')
    dispatch = {
        (2, 'h'): (1, 60 * 60 * 1000), 
        (3, 'm'): (2, 60 * 1000),  
        (3, 's'): (2, 1000), 
        (5, 's'): (3, 1),
        }
    for time_component in time_components:
        dispatch_key = (len(time_component), time_component[-1])
        if dispatch_key in dispatch:
            digit_count, multiplier = dispatch[dispatch_key]
            time_in_ms += multiplier * int(time_component[:digit_count])
    result = time_in_ms
    return result

def get_next_raw_frame_data(
        source_video: cv2.VideoCapture
        ):
    time_in_ms: int = int(source_video.get(cv2.CAP_PROP_POS_MSEC))
    read_ind, current_image = source_video.read()
    result = (read_ind, time_in_ms, current_image)
    return result

def crop_and_resize_image(
        source_image,
        source_bbox: tuple,
        target_size: tuple,
        ):
    left, top, right, bottom = source_bbox
    cropped_image = source_image[top:bottom, left:right]
    target_image = cv2.resize(cropped_image, target_size, cv2.INTER_NEAREST)
    result = target_image
    return result

def export_frame(raw_frame, time_in_ms, file_name_prefix: str):
    time_code = get_time_code(time_in_ms)
    time_in_ms = get_time_in_ms(time_code)
    assert time_in_ms == time_in_ms
    file_name = file_name_prefix + ' - ' + time_code + '.png'
    print(file_name, time_in_ms)
    cv2.imwrite(file_name, raw_frame)

def detect_mean_range(source_file: str, time_range: tuple) -> tuple:
    EPSILON_IN_MS = 15
    source_video = cv2.VideoCapture(source_file)
    start_time_in_ms = 1_000 * time_range[0] - EPSILON_IN_MS
    end_time_in_ms = 1_000 * time_range[1] + EPSILON_IN_MS
    min_frame_mean = float('inf')
    max_frame_mean = float('-inf')
    for _ in range(1_000_000):
        read_ind, time_in_ms, raw_frame = get_next_raw_frame_data(
            source_video
        )
        if not read_ind or time_in_ms > end_time_in_ms:
            break
        if time_in_ms < start_time_in_ms:
            continue
        frame_mean = raw_frame.mean()
        min_frame_mean = min(min_frame_mean, frame_mean)
        max_frame_mean = max(max_frame_mean, frame_mean)
    source_video.release()
    result = (min_frame_mean, max_frame_mean)
    return result

def detect_scenes_and_colors(
        source_file: str,
        time_range: tuple,
        frame_mean_range: tuple,
        mean_thresholds: tuple,
        ) -> tuple:
    EPSILON_IN_MS = 15
    source_video = cv2.VideoCapture(source_file)
    start_time_in_ms = 1_000 * time_range[0] - EPSILON_IN_MS
    end_time_in_ms = 1_000 * time_range[1] + EPSILON_IN_MS
    min_frame_mean = frame_mean_range[0]
    max_frame_mean = frame_mean_range[1]
    min_threshold, max_threshold = mean_thresholds
    buckets = [[] for _ in range(3)]
    for frame_id in range(1_000_000):
        read_ind, time_in_ms, raw_frame = get_next_raw_frame_data(
            source_video
        )
        if not read_ind or time_in_ms > end_time_in_ms:
            break
        if time_in_ms < start_time_in_ms:
            continue
        frame_mean = raw_frame.mean()
        channels = cv2.mean(raw_frame)
        key = (frame_mean - min_frame_mean) / (max_frame_mean - min_frame_mean)
        key = max(0.0, min(key, 1.0))
        if key < min_threshold:
            key = 0
        elif key >= max_threshold:
            key = 2
        else:
            key = 1
        if len(buckets[key]) > 0 and buckets[key][-1][3] == frame_id - 1:
            buckets[key][-1][1] = get_time_code(time_in_ms)
            buckets[key][-1][3] = frame_id
            buckets[key][-1][4] += channels[2]
            buckets[key][-1][5] += channels[1]
            buckets[key][-1][6] += channels[0]
        else:
            buckets[key].append([
                get_time_code(time_in_ms),
                get_time_code(time_in_ms),
                frame_id,
                frame_id,
                channels[2], channels[1], channels[0], # red, green, blue
                key,
            ])
    source_video.release()
    result = buckets
    return result

if __name__ == '__main__':
    '''
    Sample from a video segment to determine min and max brightness
    Usage:
    python analyze_room_transitions.py "1636_wr_dr4gonblitz.mp4"
    '''
    parser = argparse.ArgumentParser()
    parser.add_argument('source_file', help='Path to a video file', type=str)
    parser.add_argument('target_file', help='Path to output file', type=str)
    args = parser.parse_args()
    if not os.path.isfile(args.target_file):
        min_frame_mean, max_frame_mean = detect_mean_range(
            args.source_file,
            (0.0, 892.00),
        )
        print('Min frame mean =', min_frame_mean)
        print('Max frame mean =', max_frame_mean)
        buckets = detect_scenes_and_colors(
            args.source_file,
            (0.0, 1300.00),
            (min_frame_mean, max_frame_mean),
            (0.004, 0.906), # mean_thresholds (low, high)
        )
        # 0.4% darkest and 9.4% brightest seem good benchmarks
        scenes = []
        for bucket_id in (range(3)):
            for i in range(len(buckets[bucket_id])):
                (start_time_code, end_time_code, start_frame, end_frame, red, green, blue, key) = buckets[bucket_id][i]
                frame_count = end_frame - start_frame + 1
                start_time_in_ms = get_time_in_ms(start_time_code)
                end_time_in_ms = get_time_in_ms(end_time_code)
                duration_in_ms = end_time_in_ms - start_time_in_ms
                r = int(red / frame_count)
                g = int(green / frame_count)
                b = int(blue / frame_count)
                scene = (start_time_code, key, duration_in_ms, r, g, b)
                scenes.append(scene)
        scenes.sort()
        with open(args.target_file, 'w') as output_file:
            for i in range(len(scenes)):
                scene = scenes[i]
                if i < len(scenes) - 1:
                    curr_scene_start_time_in_ms = get_time_in_ms(scene[0])
                    next_scene_start_time_in_ms = get_time_in_ms(scenes[i + 1][0])
                    scene = list(scene)
                    scene[2] = next_scene_start_time_in_ms - curr_scene_start_time_in_ms
                    scene = tuple(scene)
                output_file.write(', '.join(map(str, scene)) + '\n')
    # Done
    '''
    How to identify Prologue scene:
        [Blue scene, variable length]
        [BLACK, short]
        [Very dark scene, short on Xbox 360, long on PS1]
        [BLACK, short]
        [Prologue]
    How to identify Dracula Kill:
        1-3 very bright frames followed by 1-3 darker frames, repeated 5 times
        BB--BB--BB--BB--BB---------
    Dr4gonBlitz's 16:36 WR run :
        Prologue scene starts at 00:25.458
        Official run starts at   00:27.303
        Offset is 1.845s after Prologue scene begins
    Sestren's 18:51 PB run:
        Prologue scene starts at 00:03.999
        Official run starts at   00:05.827
        Offset is 1.828s after Prologue scene begins
    Run start:
        ~2.0 seconds after the scene transition into "Prologue"
    '''
