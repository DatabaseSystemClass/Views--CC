-- SQL Movie-Rating View Modification Exercises Extra Practice

-- Q1
create trigger DeletionNoRating
instead of delete on NoRating
for each row
begin
  delete from Movie where mID = old.mID;
end;

-- Q2
create trigger DeletionNoRating2
instead of delete on NoRating
for each row
begin
  insert into Rating Values (201,old.mID,1,null);
end;
