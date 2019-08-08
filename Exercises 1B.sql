Select *from jobs_mp;
1.
Select price+5 as new_price from titles_mp order by  new_price desc;
2.
select * from stores_mp where Stores_state ='CA';
3.Display the store_id that provides least discount.
Select   stor_id,min(discount) from Discounts_mp group by stor_id storeidorder by discount;
select * from discounts_mp;
4.
Alter table titles_mp alter column au_type varchar(255) not null;
Update  titles_mp set au_type=null where au_type='UNDECIDED';
5.
Update  titles_mp set Royalty=20 where pubdate between'01/06/1991' and '01/06/1991';
6.
select  lowqty+2 as "Incremented lowqty" from Discounts_mp where discounttype='Customer Discount' ;
7.
Select title_id from royshed where lorange>1000 and hirange>1000;
8.
Select Pub_id from Publishers_mp where country='USA';
9.
Select job_desc from jobs_mp where (0.25 *max_lvl)=min_lvl;
10.
Select fname,lname from employee where minit is null;