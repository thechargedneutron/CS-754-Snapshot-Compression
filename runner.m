clear all
for B=1:30
    disp(strcat('B is :', num2str(B)))
    [X_hat, X] = mainScript(B);
    data(B) = psnr(X_hat, X);
end

plot(data)