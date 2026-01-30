n=20;
customer=(1:n);
interarrival_time=[0;unidrnd(8,n-1,1)];
arrival_time=zeros(n,1);
for i=2:n
    arrival_time(i)=interarrival_time(i)+arrival_time(i-1);
end
service_time=zeros(n,1);
A=unidrnd(100,n,1);
for i=1:n
    if A(i)>=1 && A(i)<=5
        service_time(i)=1;
    elseif A(i)>=6 && A(i)<=15
        service_time(i)=2;
    elseif A(i)>=16 && A(i)<=35
        service_time(i)=3;
    elseif A(i)>=36 && A(i)<=65
        service_time(i)=4;
    elseif A(i)>=66 && A(i)<=90
        service_time(i)=5;
    else
        service_time(i)=6;
    end
end

service_start_time=zeros(n,1);
service_end_time=zeros(n,1);

service_start_time(1)=arrival_time(1);
service_end_time(1)=service_start_time(1)+service_time(1);

for i=2:n
    service_start_time(i)=max(arrival_time(i),service_end_time(i-1));
    service_end_time(i)=service_start_time(i)+service_time(i);
end

waiting_time=service_start_time-arrival_time;

system_idle_time=zeros(n,1);
for i=2:n
    system_idle_time(i)=service_start_time(i)-service_end_time(i-1);
end

time_spent_in_system=service_end_time-arrival_time;
results=[customer',interarrival_time,arrival_time,service_start_time,service_time,service_end_time,system_idle_time,waiting_time,time_spent_in_system];
header={'customer','interarrival_time','arrival_time','service_start_time','service_time','service_end_time','system_idle_time','waiting_time','time_spent_in_system'};
T = array2table(results,'VariableNames',header)

avg_waiting_time=sum(waiting_time)/n
probability_of_wait_in_queue=nnz(waiting_time)/n
proportion_of_idle_time_in_server=sum(system_idle_time)/service_end_time(n)
avg_service_time=sum(service_time)/n
avg_interarrival_time=sum(interarrival_time)/(n-1)
avg_wait_time_those_wait=sum(waiting_time)/nnz(waiting_time)
avg_time_spent_in_system=sum(time_spent_in_system)/n
