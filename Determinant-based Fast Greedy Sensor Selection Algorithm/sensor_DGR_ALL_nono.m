    function[isensors]= sensor_DGR_ALL_nono(U, r, p, s)
    
        [n,~]=size(U);

        %PSI=[];
        %for i=1:s
        %    PSI(:,:,i)=U((1+(i-1)*n/s):(i*n/s) ,1:end);  %#ok<AGROW>
        %end
        %PSI(:,:,1)=U(1:n/s    ,1:r);
        %PSI(:,:,2)=U((n/s+1):n,1:r);
        THETApp=zeros(p,r);
        THETAppTHETApptinv=zeros(p,p);
        abs=zeros(1,n);
        tmp=zeros(s,r);
        sensor=zeros(1,p);
        for pp=1:p
            Y=eye(r)-THETApp(1:pp-1,:)'*THETAppTHETApptinv(1:pp-1,1:pp-1)*THETApp(1:pp-1,:);
            for nn=1:n/s
                 %abs(nn)=1;%C(nn,:,1)*(C(nn,:,1))';
                for ss=1:s
                    tmp(ss,:)=U(nn+(ss-1)*n/s,:);
                end
                for ss=1:s
                     abs(nn)=tmp(ss,:)*Y*tmp(ss,:)';
                     %CC=tmp(ss,:)/norm(tmp(ss,:));
                    %for st=ss+1:s
                        %tmp(st,:)=(tmp(st,:))-(CC*tmp(st,:)')*(CC);
                    %end
                end
            end
            [~,sensor(pp)]=max(abs);%sensorベクトルのpp番目の要素にabs最大になる要素の番号を入れる
            %isensors=p;
            %for ss=1:s
            %    CC=PSI(p(pp),:,ss);
             %   CC=CC/norm(CC);
              %  for st=1:s
               % PSI(:,:,st)=PSI(:,:,st)-PSI(:,:,st)*CC'*CC;
                %end
            for ss=1:s                
                THETApp(pp,:)=U(sensor(pp)+(ss-1)*n/s,:);%THETAppに行を追加
            end
                %THETAppTHETApptinv(1:pp,1:pp)=inv(THETApp(1:pp,:)*THETApp(1:pp,:)');                
                THETAppTHETApptinv(1:pp*s,1:pp*s)=inv(THETApp(1:pp*s,:)*THETApp(1:pp*s,:)');               
                
%                 z=THETApp(1:pp-1,:)*THETApp(pp,:)';
%                 THETAppTHETApptinv(1:pp-1,1:pp-1)=THETAppTHETApptinv(1:pp-1,1:pp-1)*(eye(pp-1)+z*z'*THETAppTHETApptinv(1:pp-1,1:pp-1)/abs(sensor(pp)));
%                 THETAppTHETApptinv(1:pp-1,pp)=-THETAppTHETApptinv(1:pp-1,1:pp-1)*z/abs(sensor(pp));
%                 THETAppTHETApptinv(pp,1:pp-1)=THETAppTHETApptinv(1:pp-1,pp)';
%                 THETAppTHETApptinv(pp,pp)=1/abs(sensor(pp));%逆行列の更新
            %end
       end
       isensors=sensor';

    end