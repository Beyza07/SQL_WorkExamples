create database deneme
use deneme;
Create function fn_isaret(@sayi int)
returns int 
as
Begin
	if(@sayi<0)
		return-1
	if(@sayi=0)
		return 0
	return 1
End

select dbo.fn_isaret(10)

create function tekrarla(@kelime varchar(10),@sayi int)
returns varchar(max)
as
Begin
Declare @sonuc varchar(max)=''
Declare @i int=0

while(@i<@sayi)
Begin
Set @sonuc+=@kelime
Set @i+=1
End
return @sonuc
End

select dbo.tekrarla('Gizem ',7)

create function fn_BolunurMu (@s1 int,@s2 int)


///beş adet matematiksel işlem her bir tabloda bir fonksiyon oluşturulacak 