'''
@created: 2021-05-26
@author: Sestren
'''

import argparse
from cv2 import cv2
import numpy as np
import os

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

def crop_and_resize_video(
        source_file: str,
        target_file: str,
        time_range: tuple,
        source_bbox: tuple,
        target_size: tuple,
        ) -> tuple:
    EPSILON_IN_MS = 15
    fps = 60.0
    codec = cv2.VideoWriter_fourcc(*'mp4v')
    source_video = cv2.VideoCapture(source_file)
    target_video = cv2.VideoWriter(target_file, codec, fps, target_size, True)
    start_time_in_ms = 1_000 * time_range[0] - EPSILON_IN_MS
    end_time_in_ms = 1_000 * time_range[1] + EPSILON_IN_MS
    for frame_id in range(1_000_000):
        read_ind, time_in_ms, raw_frame = get_next_raw_frame_data(
            source_video
        )
        if not read_ind or time_in_ms > end_time_in_ms:
            break
        if time_in_ms < start_time_in_ms:
            continue
        left, top, right, bottom = source_bbox
        cropped_frame = raw_frame[top:bottom, left:right]
        processed_frame = cv2.resize(
            cropped_frame,
            target_size,
            cv2.INTER_NEAREST,
        )
        target_video.write(processed_frame)
        if frame_id % 1000 == 0:
            print(time_in_ms)
    source_video.release()
    result = None
    return result

if __name__ == '__main__':
    '''
    Processes a video using the following steps:
        1) Crops the video to the clipped region's bounding box
        2) Resizes the video using nearest neighbor interpolation
        3) If possible, auto-adjusts the brightness
    Sample from a clipped region of video segment to determine min and max brightness
    Usage:
    python room_transitions "Alucard Any%% NSC 01 - 16-36-802 - Dr4gonBlitz.mp4" 0 88 1237 1021 20 1030
    python room_transitions "SOTN Alucard Any%% NSC - #279 2021-05-15 07-30-36 Complete 18-52-300 Timed 18-51-600.mp4" 680 87 1915 1025 0 1140
    '''
    parser = argparse.ArgumentParser()
    parser.add_argument('source_file', help='Path to a video file', type=str)
    parser.add_argument('target_file', help='Path to output file', type=str)
    parser.add_argument('left', help='Left of clipping box', type=int)
    parser.add_argument('top', help='Top of clipping box', type=int)
    parser.add_argument('right', help='Right of clipping box', type=int)
    parser.add_argument('bottom', help='Bottom of clipping box', type=int)
    parser.add_argument('start_time_in_s', help='Start time of the run, in seconds', type=float)
    parser.add_argument('end_time_in_s', help='End time of the run, in seconds', type=float)
    args = parser.parse_args()
    if not os.path.isfile(args.target_file):
        crop_and_resize_video(
            args.source_file,
            args.target_file,
            (args.start_time_in_s, args.end_time_in_s),
            (args.left, args.top, args.right, args.bottom),
            (256, 194), # target_size: (width, height)
        )
    # Done
