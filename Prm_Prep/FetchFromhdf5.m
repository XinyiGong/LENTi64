info = h5info('spatial_reduced_L15.hdf5');
data = info.Datasets;
for i = 1: size(info.Datasets,1)
    [data(i).data] = h5read('spatial_reduced_L15.hdf5',['/',info.Datasets(i).Name]);
end