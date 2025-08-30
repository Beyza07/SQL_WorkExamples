Use Personelvt

create trigger personellbilgigirisi
on personell
after insert
as
begin
	print'veri girisi yapildi'
end

insert into personell(personelid,perad)
values (77,'personell_20')


