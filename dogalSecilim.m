function [arapop] = dogalSecilim(population, obj, psize)
% population ,obj ve psize parametre alýr 
% Rulet Çarký yöntemiyle doðal seçilim yapýlýr

% rulet carký problemi maksimize ederek cevap verir. Biz en kucukleme problemi için sonuç bulmak
% istediðiimizde aðarlýk fonk. deðerlerini tersine ceviriyoruz.
obj = 1./obj;
sumobj = sum(obj);
probs = obj/sumobj; % koromozomlarýn hayatta kalma olasýlýklarý
cprobs = probs; % cprobs : Birikimli olasýlýk 

for i=2:psize
    % birikimli olasýlýk = 
    % kendinden önceki birikimli olasýlýk + kendi olasýlýðý
    cprobs(i) = cprobs(i-1) + probs(i);
end

% rs: [0,1] aralýðýnda rastgele, psize kadar sayýlarý üret
rs = unifrnd(0,1,[psize,1]);
arapop = population;
% rs = 0.3, 0.22, 055
% cprob = 0.2, 0.52,1

for i = 1:psize
    %find : bul
    % index = rastsal sayýnýn birikimli olasýlýkdan kucuk olduðu ilk deðeri bul
    idx = find(rs(i)<cprobs,1);
    arapop(i,:) = population(idx,:); 
end

end


