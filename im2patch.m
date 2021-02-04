function patch = im2patch(I, patchSize, stride)
% 2D I(x,y) : Patch(x,y,index)
% 2D+chanel I(x,y,c) : Patch(x,y,c,index)
patch = [];
if length(patchSize) == 1
patchSize(2)=patchSize(1);
end
if length(stride) == 1
stride(2)=stride(1);
end
L1=patchSize(1);
L2=patchSize(2);
S1=stride(1);
S2=stride(2);
if ndims(I) == 2
[L1max, L2max]=size(I);
counter=0;
for i=1:S1:L1max
for j=1:S2:L2max
idx_1=i+L1-1;
idx_2=j+L2-1;
if idx_1>=1 && idx_1 <= L1max && idx_2>=1 && idx_2 <= L2max
counter=counter+1;
patch(:,:,counter) = I(i:idx_1,j:idx_2);
end
end
end
elseif ndims(I) == 3
[L1max, L2max, L3max]=size(I);
counter=0;
for i=1:S1:L1max
for j=1:S2:L2max
	idx_1=i+L1-1;
idx_2=j+L2-1;
if idx_1>=1 && idx_1 <= L1max && idx_2>=1 && idx_2 <= L2max
counter=counter+1;
patch(:,:,:,counter) = I(i:idx_1,j:idx_2,:);
end
end
end
else
error
end