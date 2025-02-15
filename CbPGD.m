function [x_hat, e] = CbPGD(H, y, mu, max_iter)

x_hat = zeros(size(H, 2), 1);

for i=1:max_iter
    disp(strcat('Iteration: ', num2str(i)));
    e = y - H*x_hat;
    s = x_hat + mu*H'*e;
    x_hat = gof_round(s);
end

end