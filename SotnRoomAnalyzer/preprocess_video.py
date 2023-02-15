'''
@created: 2021-05-26
@author: Sestren
'''

import argparse
from cv2 import cv2
import os

class SpeedrunVideoPreprocessor:
    def __init__(self,
            source_file: str
            ):
        self.source_video = cv2.VideoCapture(source_file)

    def get_next_raw_frame_data(self):
        time_in_ms: int = int(self.source_video.get(cv2.CAP_PROP_POS_MSEC))
        read_ind, current_image = self.source_video.read()
        result = (read_ind, time_in_ms, current_image)
        return result

    def crop_and_resize_image(self,
            source_image,
            source_bbox: tuple,
            target_size: tuple,
            ):
        left, top, right, bottom = source_bbox
        cropped_image = source_image[top:bottom, left:right]
        target_image = cv2.resize(cropped_image, target_size, cv2.INTER_NEAREST)
        result = target_image
        return result

    def crop_and_resize_video(self,
            target_file: str,
            time_range: tuple, # (start_time_in_s: float, end_time_in_s: float)
            source_bbox: tuple, # (left: int, top: int, right: int, bottom: int)
            target_size: tuple, # (width: int, height: int)
            ):
        EPSILON_IN_MS: int = 15
        MS_PER_S: int = 1000
        TARGET_FRAMERATE: float = 60.0
        codec = cv2.VideoWriter_fourcc(*'mp4v')
        target_video = cv2.VideoWriter(
            target_file,
            codec,
            TARGET_FRAMERATE,
            target_size,
            True,
            )
        start_time_in_ms = MS_PER_S * time_range[0] - EPSILON_IN_MS
        end_time_in_ms = MS_PER_S * time_range[1] + EPSILON_IN_MS
        read_ind = True
        while read_ind:
            (read_ind, time_in_ms, raw_frame) = self.get_next_raw_frame_data()
            if time_in_ms > end_time_in_ms:
                break
            if time_in_ms < start_time_in_ms:
                continue
            processed_frame = self.crop_and_resize_image(
                raw_frame,
                source_bbox,
                target_size,
                )
            target_video.write(processed_frame)
        self.source_video.release()

if __name__ == '__main__':
    '''
    Processes a video using the following steps:
        1) Crops the video to the clipped region's bounding box
        2) Resizes the video using nearest neighbor interpolation
    Sample from a clipped region of video segment to determine min and max brightness
    Example usage:
        python preprocess_video "Alucard Any%% NSC 01 - 16-36-802 - Dr4gonBlitz.mp4" 0 88 1237 1021 20 1030
        python preprocess_video "SOTN Alucard Any%% NSC - #279 2021-05-15 07-30-36 Complete 18-52-300 Timed 18-51-600.mp4" 680 87 1915 1025 0 1140
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
    # Only pre-process the video if it doesn't already exist
    if not os.path.isfile(args.target_file):
        preprocessor = SpeedrunVideoPreprocessor(args.source_file)
        preprocessor.crop_and_resize_video(
            args.target_file,
            (args.start_time_in_s, args.end_time_in_s),
            (args.left, args.top, args.right, args.bottom),
            (256, 194),
            )
