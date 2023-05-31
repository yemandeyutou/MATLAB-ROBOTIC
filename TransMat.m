function [T]=TransMat(n,o,a,p)
% TransMat的作用是输入n，o，a，p
% 构建相应的齐次位姿矩阵
    n=unitVec(n);
    o=unitVec(o);
    a=unitVec(a);
    mat=[n',o',a',p'];
    T=mat;
    T(4,4)=1;


end