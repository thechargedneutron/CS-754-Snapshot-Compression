clear all
for B=1:30
    disp(strcat('B is :', num2str(B)))
    [X_hat, X] = mainScript(B, 7);
    data(B) = psnr(X_hat, X);
end
%plot(data)

%[X_hat, X, e] = mainScript(20, 7);