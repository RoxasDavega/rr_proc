function datasetResult = wp_cpu(w1,w2,w3,w4,w5,w6)
dataset = get_dataset();
name = dataset.cpuName;
dataset = removevars(dataset, ["cpuName" "powerPerf" "cores" "testDate" "socket" "category"]);
x = table2array(dataset);%data rating kecocokan dari masing-masing alternatif
k = [0,1,1,1,1,0];%atribut tiap-tiap kriteria, dimana nilai 1=atrribut keuntungan, dan 0= atribut biaya
w = [w1,w2,w3,w4,w5,w6];%Nilai bobot tiap kriteria (1= sangat buruk, 2=buruk, 3= cukup, 4= tinggi, 5= sangat tinggi)
%tahapan pertama, perbaikan bobot
[m n]=size (x); %inisialisasi ukuran x
w=w./sum(w); %membagi bobot per kriteria dengan jumlah total seluruh bobot
%tahapan kedua, melakukan perhitungan vektor(S) per baris (alternatif)
for j=1:n,
    if k(j)==0, w(j)=-1*w(j);
    end;
end;
for i=1:m,
    S(i)=prod(x(i,:).^w);
end;
%tahapan ketiga, proses perangkingan
V= S/sum(S);
datasetResult = dataset;
datasetResult.CPUname = name;
datasetResult.Result = transpose(V);
datasetResult = sortrows(datasetResult, "Result", "descend");
datasetResult = movevars(datasetResult,'CPUname','Before','price');
best = max(V);