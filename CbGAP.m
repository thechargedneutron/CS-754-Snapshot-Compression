function [x_hat, e] = CbGAP(H, y, mu, max_iter)

x_hat = zeros(size(H, 2), 1);
R = H*H';
R_inv = inv(R);
multiplier = H'*R_inv;
for i=1:max_iter
    disp(strcat('Iteration: ', num2str(i)));
    e = y - H*x_hat;
    s = x_hat + mu*multiplier*e;
    x_hat = gof_round(s);
end

end