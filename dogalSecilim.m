function [arapop] = dogalSecilim(population, obj, psize)
% population ,obj ve psize parametre al�r 
% Rulet �ark� y�ntemiyle do�al se�ilim yap�l�r

% rulet cark� problemi maksimize ederek cevap verir. Biz en kucukleme problemi i�in sonu� bulmak
% istedi�iimizde a�arl�k fonk. de�erlerini tersine ceviriyoruz.
obj = 1./obj;
sumobj = sum(obj);
probs = obj/sumobj; % koromozomlar�n hayatta kalma olas�l�klar�
cprobs = probs; % cprobs : Birikimli olas�l�k 

for i=2:psize
    % birikimli olas�l�k = 
    % kendinden �nceki birikimli olas�l�k + kendi olas�l���
    cprobs(i) = cprobs(i-1) + probs(i);
end

% rs: [0,1] aral���nda rastgele, psize kadar say�lar� �ret
rs = unifrnd(0,1,[psize,1]);
arapop = population;
% rs = 0.3, 0.22, 055
% cprob = 0.2, 0.52,1

for i = 1:psize
    %find : bul
    % index = rastsal say�n�n birikimli olas�l�kdan kucuk oldu�u ilk de�eri bul
    idx = find(rs(i)<cprobs,1);
    arapop(i,:) = population(idx,:); 
end

end


