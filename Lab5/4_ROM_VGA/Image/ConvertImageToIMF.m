clear;clc;

% Read iamge
image_array = imread('image.bmp');
% Get image size
[height,width,z]=size(image_array);

% Get image data
red = image_array(:,:,1);
r = uint32(reshape(red', 1 ,height*width));
green = image_array(:,:,2);
g = uint32(reshape(green', 1 ,height*width));
blue = image_array(:,:,3);
b = uint32(reshape(blue', 1 ,height*width));

% Init store data
rgb=zeros(1,height*width);

% Convert image data from RGB888 to RGB565
for i = 1:height*width
    rgb(i) = bitshift(bitshift(r(i),-3),11)...
             + bitshift(bitshift(g(i),-2),5)...
             + bitshift(bitshift(b(i),-3),0);
end

% Write mif file
fid = fopen( 'image.mif', 'w+' );
fprintf( fid, 'WIDTH=16;\n');
fprintf( fid, 'DEPTH=%d;\n', height*width);
fprintf( fid, 'ADDRESS_RADIX=UNS;\n');
fprintf( fid, 'DATA_RADIX=HEX;\n');
fprintf(fid,'%s %s\n','CONTENT','BEGIN');
for i = 1:height*width
    fprintf(fid,'\t%d\t:%x\t;\n',i-1,rgb(i));
end
fprintf(fid,'END;');
fclose( fid );
