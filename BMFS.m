%A bipartite matching-based feature selection for multi-label learning-2020

function Feature_Ranks= BMFS(dataTrain,dataTrainLabels,ns)

% ns = number of requested features
cordis = pdist2(dataTrain',dataTrainLabels','correlation');
cordis(isnan(cordis)) = 0;

%% label weights
for q=1: size(dataTrainLabels,2)
       ff=length(find(dataTrainLabels(:,q)==1));
       cor1(q)= ff/size(dataTrainLabels,1);
end
Wcordis = cor1 .* cordis;
Edg = pdist2(Wcordis,Wcordis);
e=sum(Edg,2);
[e1 e]=sort(-cor1);
Feature_Ranks= sort1(e,cordis,ns);
end