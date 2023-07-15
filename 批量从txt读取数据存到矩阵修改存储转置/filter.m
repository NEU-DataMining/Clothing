%========== PROBLEM DEFINIATION;PARAMETER DEFINITION ============
WorkName='PFMFCS';
TimeUnit='hours';
dt=1;
measuData=y;
% measured data at every time interval
thres=3.2106;
ParamName=['x';'b';'s'];
initDisPar=[3.227 3.427;0 0.0002;0.001 0.005];
% Probability Parametes of initial distribution
% (p : num.of unknown param; q : num.probability of param)
n=2e3;  % number of particles
signiLevel=5; % significance level for C.I. and P.I.
%=================================================================
% % %============ PROGNOSTICS using Particle Filter ==============
p=size(ParamName,1);
for j=1:p;
    param(j,:)=unifrnd(initDisPar(j,1),initDisPar(j,2),1,n);
    ParamResul(j,:)=[ParamName(j,:) 'Resul'];
    eval([ParamResul(j,:) '=param(j,:);']);
end;
k1=length(measuData);k=1;
if measuData(end)-measuData(1)<0;cofec=-1; else cofec=1; end
while min(eval([ParamResul(1,:) '(k,:)'])*cofec)<thres*cofec; k=k+1;
    % step1. prediction (prior)
    paramPredi=param;
    for j=1:p;eval([ParamName(j,:) '=paramPredi(j,:);']);end
    paramPredi(1,:)=...%=== PROBLEM DEFINIATION: MODEL DEFINITION ===
                    -b*dt+x;
    % ===============================================================
  if k<=k1                                         % (Update Process)
      % step2. update (likelihood)
      likel=normpdf(measuData(k),paramPredi(1,:),paramPredi(end,:));
      % step3. resampling
      cdf=cumsum(likel)./max(sum(likel));
      for i=1:n;
          u=rand;
          loca=find(cdf>=u);
          param(:,i)=paramPredi(:,loca(1));
      end;
  else
      param=paramPredi;
  end
  for j=1:p;eval([ParamResul(j,:) '(k,:)=param(j,:);']); end;
  if k>k1;
     eval([ParamResul(1,:) '(k,:)=normrnd(param(1,:),param(end,:));']);
  end
end
% % % POST-PROCESSING
time=(0:dt:dt*(k-1))';
perceValue=[50 signiLevel 100-signiLevel];      % RUL Calculation
for i=1:n;
    loca=find(eval([ParamResul(1,:) '(:,i)'])*cofec>=thres*cofec);
    RUL(i)=time(loca(1))-time(k1);
end;
RULPerce=prctile(RUL',perceValue);
figure;set(gca,'fontsize',14);hist(RUL,24);  % RUL Rsults Display
xlim([min(RUL) max(RUL)]);xlabel(['RUL' '(' TimeUnit ')']);
titleName=['at' ' ' num2str(time(k1)) ' ' TimeUnit]; title(titleName)
fprintf('\n # Percentiles of RUL at %g hours \n',time(k1))
fprintf('\n %gprct: %g, median: %g, %gprct: %g \n',perceValue(2),...
   RULPerce(2),RULPerce(1), perceValue(3),RULPerce(3));
Name=[WorkName 'at' num2str(time(k1)) '.mat'];save(Name); % work save