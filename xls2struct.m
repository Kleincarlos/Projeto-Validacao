function S=xls2struct(file)
[a,b,data]=xlsread(file);
[l,c]=size(data);

S=struct(lower(char(data(1,1))),{data(2:l,1)});
for i=2:c
    col=[];
    cols={};
    for j=2:l
       if ischar(data{j,i})
            cols{j-1,1}=data{j,i};
        else
            col(j-1,1)=data{j,i};
        end
    end
    if ischar(data{2,i})
        [S.(lower(char(data(1,i))))]={cols{:,1}}
        S.(lower(char(data(1,i))))=S.(lower(char(data(1,i))))'
    else
        [S.(lower(char(data(1,i))))]=col(:,1);
    end
end