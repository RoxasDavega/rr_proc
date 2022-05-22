function dataset = get_dataset()
%dataset = readtable("laptops.csv");
dataset = readtable("CPU_benchmark.csv");
dataset = rmmissing(dataset);
picked = ismember(dataset.category, "Desktop");
dataset(not(picked), :) = [];
dataset.price = fix(dataset.price);
dataset = head(dataset,250);

end