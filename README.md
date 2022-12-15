# Sega Genesis Palette Scroll Demo
An old, well known trick. Updates the palette on each line of a base pattern to draw an image.
The formation of the base pattern determines how the image is distorted, which can be used for some neat effects.

Program and its source for converting an image into a series of color data for this demo is included.

## Why aren't horizontal interrupts being used?
Because they are too slow. No matter how optimal I make the palette updating code, the interrupt itself takes too long, which makes the palette update bleed into when the screen begins drawing again, which then causes Color RAM dots (a bug in the Genesis' video display processor in which it'll draw a dot of the color that's written to Color RAM at whatever position it's drawing at). So, I opted to manually check when an H-BLANK period is about to start, and then immediately update the palette.

This is actually exactly how the [moose chase section in Mickey Mania](https://www.youtube.com/watch?v=nt-AxAqlrOo) does the floor rendering.

## Why do you set and clear the display flag repeatedly?
VDP DMAs are much quicker when display is disabled.

## Special Thanks
vladikcomper - [Error handler/debugger](https://github.com/vladikcomper/md-modules).