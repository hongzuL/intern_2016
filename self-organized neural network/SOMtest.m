x = simplecluster_dataset;
net = selforgmap([8 8]);
[net,tr] = train(net,x);
view(net)
y = net(x);
classes = vec2ind(y);