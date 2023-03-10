'''
@created: 2021-05-27
@author: Sestren
'''

import argparse
from cv2 import cv2
import tkinter
from PIL import Image, ImageTk
# import PIL.ImageTk

class VideoFeed():
    def __init__(self, video_file: str):
        self.video = cv2.VideoCapture(video_file)
        self.read_ind, self.raw_frame = self.video.read()
        # Determine length of video
        self.video.set(cv2.CAP_PROP_POS_AVI_RATIO, 1.0)
        self.duration_in_ms = self.video.get(cv2.CAP_PROP_POS_MSEC)
        self.video.set(cv2.CAP_PROP_POS_AVI_RATIO, 0.0)
        # )
        self.position_in_ms = int(self.video.get(cv2.CAP_PROP_POS_MSEC))
        self.start_in_ms = 0
        self.end_in_ms = self.duration_in_ms
        # cap.set(CV_CAP_PROP_BUFFERSIZE, buffer_size_in_frames)
    
    def next_frame(self, skip: int=0):
        for _ in range(skip):
            self.read_ind = self.video.grab() > 0
        if skip <= 0:
            self.read_ind, self.raw_frame = self.video.read()
        else:
            self.read_ind, self.raw_frame = self.video.retrieve()
        self.position_in_ms = int(self.video.get(cv2.CAP_PROP_POS_MSEC))
        self.raw_frame = cv2.cvtColor(self.raw_frame, cv2.COLOR_BGR2RGB)
    
    def set_time(self, time_in_ms: int):
        self.video.set(cv2.CAP_PROP_POS_MSEC, time_in_ms)
        self.position_in_ms = int(self.video.get(cv2.CAP_PROP_POS_MSEC))

class TestApp(tkinter.Frame):

    def __init__(self,
        master: tkinter.Tk,
        runs: dict,
        width: float,
        height: float,
    ):
        tkinter.Frame.__init__(self, master)
        self.master.minsize(width=100, height=100)
        self.master.config(background='grey')
        self.master.bind('<Left>', self.left_key)
        self.master.bind('<Right>', self.right_key)
        self.master.bind('<Up>', self.up_key)
        self.master.bind('<Down>', self.down_key)
        self.master.bind('<z>', self.z_key)
        self.master.bind('<x>', self.x_key)
        self.main_frame = tkinter.Frame()
        self.main_frame.pack(fill='both', expand=True)
        self.pack()
        self.canvas = tkinter.Canvas(master, width=width, height=height)
        self.canvas.config(background='grey')
        self.canvas.pack()
        self.width = width
        self.height = height
        self.scenes = {}
        self.feeds = {}
        for run_name, (video_file, source_file) in runs.items():
            with open(source_file) as open_file:
                self.scenes[run_name] = []
                self.feeds[run_name] = VideoFeed(video_file)
                for line in open_file.readlines():
                    parts = line.split(', ')
                    start_time_code = parts[0]
                    scene_type = int(parts[1])
                    scene_duration_in_ms = int(parts[2])
                    scene_mean_red = int(parts[3])
                    scene_mean_green = int(parts[4])
                    scene_mean_blue = int(parts[5])
                    scene = (
                        start_time_code,
                        scene_type,
                        scene_duration_in_ms,
                        scene_mean_red,
                        scene_mean_green,
                        scene_mean_blue,
                    )
                    self.scenes[run_name].append(scene)
        self.offsets = [0] * len(runs)
        self.offset_cursor = 0
        self.scale = 1
        # Grab a frame
        self.durations = {}
        self.photo_images = {}
        for run_name, feed in self.feeds.items():
            feed.next_frame()
            image_frame = Image.fromarray(feed.raw_frame)
            photo_image = ImageTk.PhotoImage(image=image_frame)
            self.photo_images[run_name] = photo_image

    def update_and_render(self):
        self.canvas.delete('all')
        left_pad = 256 + 80
        top_pad = 8
        # TODO: Have benchmark be width of slowest section, with -1, -3, and -9 second offsets
        self.canvas.create_rectangle(
            left_pad, 0,
            left_pad + (1 * 1000) / self.scale, 8 + 52 * len(self.offsets),
            fill='#ff0000',
        )
        x = 0
        y0 = top_pad
        y1 = 40
        for i, run_name in enumerate(self.scenes):
            run_data = self.scenes[run_name]
            x = 0
            offset = max(0, min(len(self.scenes[run_name]), self.offsets[i]))
            scrub = 0
            for j in range(offset):
                scrub += self.scenes[run_name][j][2]
            for j, row_data in enumerate(run_data):
                visible = j >= self.offsets[i]
                start_time_code = row_data[0]
                scene_type = row_data[1]
                scene_duration_in_ms = row_data[2]
                width = scene_duration_in_ms
                color = "red"
                if scene_type == 0:
                    color = "black"
                elif scene_type == 2:
                    color = "white"
                else:
                    r, g, b = row_data[3:]
                    color = f'#{r:02x}{g:02x}{b:02x}'
                if visible:
                    self.canvas.create_rectangle(
                        left_pad + ((x - scrub) / self.scale), y0,
                        left_pad + ((x + width - scrub) / self.scale), y1,
                        fill=color,
                    )
                x = x + width
            y0 += 44
            y1 += 44
        offset = 0
        scene_durations = []
        for i, (run_name, feed) in enumerate(self.feeds.items()):
            scene_durations.append(
                self.scenes[run_name][self.offsets[i]][2]
            )
            feed.next_frame()
            image_frame = Image.fromarray(feed.raw_frame)
            self.photo_images[run_name].paste(image_frame)
            self.canvas.create_image(
                0, offset,
                anchor=tkinter.NW,
                image=self.photo_images[run_name],
            )
            self.canvas.pack()
            self.canvas.create_text(
                left_pad - 4,
                8 + offset,
                fill="white",
                font="Consolas 12",
                text=scene_durations[i],
                anchor=tkinter.NE,
            )
            if i > 0:
                self.canvas.create_text(
                    left_pad - 4,
                    32 + offset,
                    fill="black",
                    font="Consolas 12 bold",
                    text=scene_durations[i] - scene_durations[0],
                    anchor=tkinter.NE,
                )
            offset += 200
        self.after(17, self.update_and_render)
    
    def z_key(self, event):
        self.scale = max(1, self.scale >> 1)
    
    def x_key(self, event):
        self.scale = min(1000, self.scale << 1)
    
    def left_key(self, event):
        if self.offset_cursor >= len(self.offsets):
            for i in range(len(self.offsets)):
                self.offsets[i] -= 1
            self.offset_cursor = len(self.offsets)
        else:
            self.offsets[self.offset_cursor] -= 1
        for i, (run_name, feed) in enumerate(self.feeds.items()):
            scrub = 0
            for i in range(self.offsets[i]):
                scrub += self.scenes[run_name][i][2]
            feed.set_time(scrub)
    
    def right_key(self, event):
        if self.offset_cursor >= len(self.offsets):
            for i in range(len(self.offsets)):
                self.offsets[i] += 1
            self.offset_cursor = len(self.offsets)
        else:
            self.offsets[self.offset_cursor] += 1
        for i, (run_name, feed) in enumerate(self.feeds.items()):
            scrub = 0
            for i in range(self.offsets[i]):
                scrub += self.scenes[run_name][i][2]
            feed.set_time(scrub)
    
    def up_key(self, event):
        self.offset_cursor = max(0, self.offset_cursor - 1)
    
    def down_key(self, event):
        self.offset_cursor = min(len(self.offsets), self.offset_cursor + 1)

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('video_a', help='Path to the first video file', type=str)
    parser.add_argument('rooms_a', help='Path to the first transitions file', type=str)
    parser.add_argument('video_b', help='Path to the second video file', type=str)
    parser.add_argument('rooms_b', help='Path to the second transitions file', type=str)
    args = parser.parse_args()
    runs = {
        'run_a': [args.video_a, args.rooms_a],
        'run_b': [args.video_b, args.rooms_b],
    }
    root = tkinter.Tk()
    app = TestApp(root, runs, 1500, 800)
    root.after(200, app.update_and_render)
    root.mainloop()