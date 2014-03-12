function xlswriteS(file,M,S)
%xlswriteS(file,M,S)
% file - nome do arquivo com direção completa
% M    - matriz de dados
% S    -cabeçalho: primeira linha da planilha

z=upper('abcdefghijklmnopqrstuvwxyz');
z1=upper('abcdefghijklmnopqrstuvwxyz');

[L,C]=size(M);
a=floor(C/26);

if a==C/26
    a=a-1;
end
if a>0
    zf=strcat(z1(a),z1(C-26*a));
else
    zf=z1(C);
end
xlswrite(file,M,strcat(strcat('A2:',zf),num2str(L+1)));

xlswrite(file,S,strcat(strcat('A1:',zf),num2str(1)))