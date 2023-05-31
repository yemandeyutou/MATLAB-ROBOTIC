function [vec] = unitVec(initVec)
%unitVec 将向量转化为单位向量

x=initVec(1);y=initVec(2);z=initVec(3);

vecLength_square=x^2+y^2+z^2;
 if(vecLength_square==0) vec=[0,0,0];
 else
    k=1/sqrt(vecLength_square);
    vec=k*initVec;
 end
end

