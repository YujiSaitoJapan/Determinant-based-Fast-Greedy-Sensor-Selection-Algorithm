    function[isensors]= sensor_DGR(U, r, p, s, H, isensors)

        [n,~]=size(U);
        [ps,~]=size(isensors);
        ip=isensors';
        C=H*U;      
        CTC=C'*C;
          
        for i=1:s
            for is=isensors'
                U(n*(i-1)/s+is,:)=zeros(1,r);
            end
        end
        
        CTCI=inv(CTC);
        
        for pp=(ps+1):p
            for nn=1:n/s
                for i=1:s
                    v(i,:)=U(n*(i-1)/s+nn,:);                  
                end
                J(nn)=det(eye(s,s) + v*CTCI*v');
            end
            [~,ip(pp)]=max(J);
            for i=1:s
                v(i,:)=U(n*(i-1)/s+ip(pp),:);                  
            end          
            CTCI=CTCI*(eye(r,r)- v' * inv(eye(s,s)+v*CTCI*v') * v *CTCI);
            for i=1:s;
            U(n*(i-1)/s+ip(pp),:)=zeros(1,r);
            end 
            CTC=CTC+v'*v;
            det(CTC);
            det(inv(CTCI));
       end
       isensors=ip';

    end