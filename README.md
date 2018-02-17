## TL;DR

A small Processing for Java program which outputs large printable graphics for picture frames or glass doors on furniture.

## Long version

This Processing for Java script solved one purpose for me and I am really happy with the result so I thought it could be useful for others.

I have two IKEA Billy shelves next to each other, each with two IKEA Morliden glass doors which can be used as a large picture frame :framed_picture:. I wanted to put something in it but couldn't find a picture with a sufficient resolution.

[This video](https://www.youtube.com/watch?v=bEyTZ5ZZxZs) inspired me to do my first Processing project.

The program does two things:

1. It creates a graphic, in my case a TenPrint clone.
2. It slizes the graphic into four parts and saves them seperatly. This step considers:
    * padding for the door frames so the graphic doesn't shift from door to door. 
    * [bleed](https://www.wikiwand.com/en/Bleed_(printing)) for the printing house.

After running the program I just had to open the graphics with Photoshop/Gimp and set the correct ppi (300 in my case), convert it to CMYK using the color profile my printing house provided and save it as PDFs. No scaling or cropping required.

## The Result 

![result](https://raw.githubusercontent.com/henningBunk/framed10print/master/result.jpg)

I am sure you can adjust the program for your specific needs. Have fun and please share the results with me :framed_picture: :+1: