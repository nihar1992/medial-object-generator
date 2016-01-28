Programming Language: MATLAB

Operating system: WINDOWS

Compiler / Interpreter: N/A

Instructions:

All of the source codes are functions,
where the main code is medial_object.m.
In order to run the code, on MATLAB's
command window, type in the following:

medial_object(filename)

The filename should be a string enclosed
by an apostrophe; for example 'lizard.wrl'.

The .wrl files in the folder were used to
generate test cases in our interim report.
We tried our best to make our code as
general as possible, so you could come up
with a random polygon, and our code will
still work. However, there is one
restriction.

One thing to note is that we have found
different softwares tend to save .wrl
files in a different format. For instance, in
SolidWorks, if you save a two dimensional
polygon as a .wrl file, it automatically
creates triangular meshes. On the other
hand, CATIA only saves the boundary lines
in a consistent ordering, either clockwise
or counterclockwise.

We have made our code to work for .wrl
files generated from CATIA. As such,
if you draw run a .wrl file generated from
any other software, it will not work.

Lastly, the current step size is 300, and
this usually takes about a minute to run.
You can manually modify this if by opening
the medial_object.m file; you will be able
to find it on the third line. Thank you for
reading!