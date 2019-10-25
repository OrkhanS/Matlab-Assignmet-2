%--------------------------- Task 2 ---------------------------

image2 = imread('Q2_Input.tif');
figure(2);
imshow(image2);
title('Q2_Original');
[x, y] = size(image2);

for i = 1:x
   for j = 1:y
       image2(i,j) = 255 - image2(i,j);  %negative transformation
   end
end

figure(3);
imshow(image2);
title('Q2_Negative');
imwrite(image2, 'Q2_Output.tif');

%--------------------------- Task 3 ---------------------------

image3 = imread('Q3_Input.tif');
figure(4);
imshow(image3);
title('Q3_Original');


matrix = [1/15, 1/15, 1/15;
           1/15, 1/15, 1/15;
           1/15, 1/15, 1/15];  %average filter
       
FilterImage3 = uint8(conv2(image3, matrix, 'same'));
FilterImage3 = image3 - FilterImage3;

figure(5);
imshow(FilterImage3);  %blurred image
title('Q3_Blurred');

BinaryImage3 = double(zeros(size(FilterImage3)));           
[x1, y1] = size(image3);

for i=1:x1
    for j=1:y1
        if (FilterImage3(i, j) < 126)
            BinaryImage3(i, j) = 0;
        else
            BinaryImage3(i, j) = 1;    
        end
    end
end

figure(6);
imshow(BinaryImage3)       %binary image
title('Q3_Binary');
imwrite(BinaryImage3, 'Q3_Output.tif');

%--------------------------- Task 4 ---------------------------

image4 = imread('Q4_Input.tif');
figure(7);
imshow(image4);
title('Q4_Original');


matrix2 = [0, 1, 0;
          1, -4, 1;
          0, 1, 0];        %Laplacian mask
      
SharpenedImage4 = uint8(conv2(image4, matrix2, 'same'));
SharpenedImage4 = image4 - SharpenedImage4;

figure(8);
imshow(SharpenedImage4)        %sharpened image
title('Q4_Sharpened');
imwrite(SharpenedImage4, 'Q4_Output.tif');

%--------------------------- Task 5 ---------------------------

image5 = imread('Q5_Input.tif');
figure(9);
imshow(image5);
title('Q5_Original');
image5=rgb2gray(image5);

EdgeHorizontal =  [-1, -2, -1;
                  0, 0, 0;
                  1, 2, 1];    % Horizontal Sobel 

EdgeVertical =  [-1, 0, 1;
                  -2, 0, 2;
                  -1, 0, 1];  % Vertical Sobel 
              
EnhancedHorizontal = uint8(conv2(image5, EdgeHorizontal, 'same'));
EnhancedVertical = uint8(conv2(image5, EdgeVertical, 'same'));
              
Enhanced = EnhancedHorizontal + EnhancedVertical;

figure(10);
imshow(Enhanced)
title('Q5_Enhanced');
imwrite(Enhanced, 'Q5_Output.tif');
