function b=sort1(e,d,ns)
[row column]=size(d);
idx=[1:row];%index of all features
b=[];%selected features
r=[];%remaining features
temp=[];
k=row-column;
z=zeros(row,k);
d=[d z];
[C,T]=hungarian(d);
temp=C(1:column);
for i=1:column
    h(i)=temp(e(i));
end    
%[s ,ids]=sort(-h);
%tm=temp(ids);
b=[b h];
r=setdiff(idx,b);
if length(b)>=ns
        b=[b r];
        r=[];
end   
temp=[];
while isempty(r)==0
    q=d(r,1:column);
    [row column]=size(q);
    %idf=[1:row];
    k=row-column;
    z=zeros(row,k);
    q=[q z];
    [C,T]=hungarian(q);
    temp=C(1:column);
    o=r(temp);
    for i=1:column
       h(i)=o(e(i));
    end  
    %[s ,ids]=sort(-h);
    %tm=o(ids);
    b=[b h];
    r=setdiff(idx,b);
    temp=[];
    if length(b)>=ns
        b=[b r];
        r=[];
    end   
end    
b=b';
end
