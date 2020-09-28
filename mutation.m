function [arapop] = mutation(arapop, pmutation, psize, d, delta, as,us)
% pmutation : mutasyon olas�l��� 
% psize: pop_size, sat�r baz�nda
% d : problemin boyutu, sutun baz�nda

rs = unifrnd(0,1,[psize,d]);

% Her sat�r, sutun i�in
for i=1:psize 
    for j = 1:d 
    % Uretilen rastsal say� kucuk mutasyon olas�l�g�ndan ise mutasyon yap
    if(rs(i,j)<pmutation)
        rs2 = unifrnd(0,1);
        % yeni arapop : arapop + uretilen rastsal de�er * izin verilen
        % komusuluk buyuklugu *komsuluk buyuklugunun aral�g� 
        arapop(i,j) = arapop(i,j)+rs2*delta*(us-as);
        
    end
    end
end

end

