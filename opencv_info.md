####

```bash
cv::Mat m;
outFloat_.create( 1, 4, CV_32FC3); 
outFloat_ = (Mat_<float>(2,2) << 1, 2, 3, 4);
outFloat_.setTo( cv::Scalar( 1.0f, 2.0f, 3.0f, 4.0f ) );
```
