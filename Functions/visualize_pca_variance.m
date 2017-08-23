function visualize_pca_variance(S,nume)

% Yuksel C. Yabansu, Georgia Institute Of Technology

% This function takes the singular values obtained from PCA and plots the
% individual variance of each principal component along with the cumulative
% variance.
% nume - the number of eigenvalues put into the plot. If this is 5, there
% will be 5 columns with individual and cumulative values. This number does
% not affect the variance of the components.
% S - This is the matrix that contains the singular values on the diagonals.
% This matrix should contain as many singular values as possible to cover
% all variance as this function assumes that whatever S is inserted, it has
% all the information about the data.

if size(S,2)>1
    Sd=diag(S).^2;
else Sd=S;
end

Sdi=Sd/sum(Sd)*100;
Sdc=cumsum(Sd)/sum(Sd)*100;

b=bar(1:length(Sd(1:nume)),Sdi(1:nume));
hold on
p=plot(1:length(Sd(1:nume)),Sdc(1:nume),'kd-','LineWidth',1.5,'MarkerFaceColor','black');
grid on
xlim([0.5 nume+0.5])
ylim([0 100])
set(b,'FaceColor','cyan','BarWidth',0.5)
xlabel('Eigenvalue index','FontSize',12,'FontWeight','bold')
ylabel('Variance (%)','FontSize',12,'FontWeight','bold')
set(gca,'FontSize',12)
l=legend('Individual Variance','Cumulative Variance');
set(l,'FontSize',12)
for ii=1:nume
    text(ii-0.25,Sdc(ii)-5,[num2str(round(Sdc(ii),2)) '%'],'FontSize',12);
    if ii>1
        text(ii-0.25,Sdi(ii)+4,[num2str(round(Sdi(ii),2)) '%'],'FontSize',12);
    end
end
