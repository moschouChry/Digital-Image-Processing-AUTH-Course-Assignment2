# Digital Image Processing AUTh Course - Assignment 2
<p>
This is the second assignment of the course Digital Image Processing (AUTh, Department of Electrical and Computer Engineering - 8th semester). The goal is to build MATLAB functions that Hough transform, Harris Corner Detection and Image Rotation to the input images.
</p>
<h2>Hough transform</h2>
<p>
The Hough Transform is concerned about the identification of lines in the image. Our own implementation can be found in the myHoughTransform.m and the script that demonstrates the functionality of the algorithm is the deliverable_1.m. The input image is resized 10%, converted to grayscale and normalized at the range of [0,1]. We apply a Gaussian smoothing with standard deviation of 0.5 and a Sobel Edge Detector, in order to get the clipped image that becomes input to the Hough Transform algorithm. <br>
The input image with the lines detected:
<p align="center">
  <img src="https://user-images.githubusercontent.com/116058576/196715065-cb4331d8-55a5-40be-a228-087012cc3806.png" />
</p>
</p>

<h2>Harris Corner Detector</h2>
<p>
Harris Corner Detector is a corner detection operator that is used to extract corners and infer features of an image. Our own implementation can be found in the myDetectHarrisFeatures.m and the script that demonstrates the functionality of the algorithm is the deliverable_2.m. The input image is resized 10%, converted to grayscale and normalized at the range of [0,1]. We apply a Gaussian smoothing with standard deviation of 2 <br>
The input image with the edges detected:
<p align="center">
  <img src="https://user-images.githubusercontent.com/116058576/196716138-546f7074-d920-4bf5-85bf-258b933f8d6a.png" />
</p>
</p>

<h2>Image Rotation</h2>
<p>
In this part we build an anti-clockwise rotation function. Our own implementation can be found in the myImgRotation.m and the script that demonstrates the functionality of the algorithm is the deliverable_3.m. <br>
The input image rotated counter clockwise by 45°:
<p align="center">
  <img src="https://user-images.githubusercontent.com/116058576/196717606-7a5cca2a-b996-4111-b950-8fc5d2c5f3e1.png" />
</p>
</p>







