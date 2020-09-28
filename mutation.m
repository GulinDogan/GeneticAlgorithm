function [arapop] = mutation(arapop, pmutation, psize, d, delta, as,us)
% pmutation : mutasyon olasýlýðý 
% psize: pop_size, satýr bazýnda
% d : problemin boyutu, sutun bazýnda

rs = unifrnd(0,1,[psize,d]);

% Her satýr, sutun için
for i=1:psize 
    for j = 1:d 
    % Uretilen rastsal sayý kucuk mutasyon olasýlýgýndan ise mutasyon yap
    if(rs(i,j)<pmutation)
        rs2 = unifrnd(0,1);
        % yeni arapop : arapop + uretilen rastsal deðer * izin verilen
        % komusuluk buyuklugu *komsuluk buyuklugunun aralýgý 
        arapop(i,j) = arapop(i,j)+rs2*delta*(us-as);
        
    end
    end
end

end

