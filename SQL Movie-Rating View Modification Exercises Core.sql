-- SQL Movie-Rating View Modification Exercises Core

-- Q1
create trigger UpdateTitleLateRating
instead of update of title on LateRating
for each row
when new.mID = old.mID
begin
  update Movie
    set title = new.title
    where mID = new.mID;
end;

-- Q2
create trigger UpdateStarLateRating
instead of update of stars on LateRating
for each row
when new.mID = old.mID and new.ratingDate = old.ratingDate
begin
  update Rating
    set stars = new.stars
    where mID = new.mID and ratingDate = new.ratingDate;
end;

-- Q3
create trigger  UpdateMIDLateRating
  instead of update of mID on LateRating
  for each row
  when new.mID <> old.mID
  begin
  update Movie set mID = new.mID where mID = old.mID;
  update Rating set mID = new.mID where mID = old.mID;
end;

-- Q4
create trigger DeletHighRated
  instead of delete on HighlyRated
  for each row
  begin
  delete from Rating
    where mID = old.mID and stars > 3;
end;

-- Q5
create trigger DeletHighRated2
instead of delete on HighlyRated
for each row
begin
  update Rating set stars = 3
  where mID = old.mID and stars > 3;
end;
