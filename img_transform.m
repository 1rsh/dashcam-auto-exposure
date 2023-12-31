classdef img_transform
    methods
        function processed_img  = histogram_equalisation(~, img, show)
            hsv_im = rgb2hsv(img);   
            hist_hsv = histeq(hsv_im(:, :, 3));
            hsv_im(:, :, 3) = hist_hsv;
            processed_img = hsv2rgb(hsv_im);
            if show==1
                figure;
                subplot(2, 1, 1);
                imshow(img);
                title('Original Image');
                subplot(2, 1, 2);
                imshow(processed_img);
                title('Processed Image');
            end
        end


        function processed_img  = cla_histogram_equalisation(~, img, numTiles, show)
            lab_im = rgb2lab(img);
            L = lab_im(:,:,1)/100;
            L = adapthisteq(L,'NumTiles',numTiles,'ClipLimit',0.005);
            lab_im(:,:,1) = L*100;
            processed_img = lab2rgb(lab_im,'OutputType','uint8');
            if show==1
                figure;
                subplot(2, 1, 1);
                imshow(img);
                title('Original Image');
                subplot(2, 1, 2);
                imshow(processed_img);
                title('Processed Image');
            end
        end
    end
end


