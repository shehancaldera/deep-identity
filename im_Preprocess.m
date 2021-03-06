%This script points to the images of me and some images (about 30) of other
%people. The images are then augmented: rotated in random angles and
%resized to 227x227 to fit with Alexnet input layer.
%Author: Shehan Caldera

shehan_dir = 'C:\Users\Shehan Caldera\Pictures\deepID data\Original\Shehan';
shehan_out = 'C:\Users\Shehan Caldera\Pictures\deepID data\Augmented\Shehan';

other_dir = 'C:\Users\Shehan Caldera\Pictures\deepID data\Original\Other';
other_out = 'C:\Users\Shehan Caldera\Pictures\deepID data\Augmented\Other';


%Augment Images of You
for i=1:50
    img = imread(sprintf('%s/shehan (%i).jpg',shehan_dir,i));
    rot_ang = randi(90,[1 100]);
    
    for j=1:100
        rot_img=imrotate(img,rot_ang(j));
        rot_img=imresize(rot_img,[227 227]);
        imwrite(rot_img,sprintf('%s/shehan_%i_%i.jpg',shehan_out,i,j));
    end
end

%Augment Images of Others
for i=1:50
    img = imread(sprintf('%s/other (%i).jpg',other_dir,i));
    rot_ang = randi(90,[1 100]);
    
    for j=1:100
        rot_img=imrotate(img,rot_ang(j));
        rot_img=imresize(rot_img,[227 227]);
        imwrite(rot_img,sprintf('%s/other_%i_%i.jpg',other_out,i,j));
    end
end



