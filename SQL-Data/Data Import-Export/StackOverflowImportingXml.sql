--Drop Table
Drop Table StackExchange_Source_Raw;
go

--Create Table
CREATE TABLE StackExchange_Source_Raw 
(
IntCol int primary key identity(1,1)
, SourceName varchar(255)
, XmlCol xml
);
GO


--Import XML
INSERT INTO StackExchange_Source_Raw
(SourceName,XmlCol)
SELECT 'Money.StackExchange.Badges',* FROM OPENROWSET(
   BULK 'E:\Downloads\Money.StackExchange\Badges.xml',
   SINGLE_BLOB) AS x;

INSERT INTO StackExchange_Source_Raw
(SourceName,XmlCol)
SELECT 'Money.StackExchange.Comments',* FROM OPENROWSET(
   BULK 'E:\Downloads\Money.StackExchange\Comments.xml',
   SINGLE_BLOB) AS x;

INSERT INTO StackExchange_Source_Raw
(SourceName,XmlCol)
SELECT 'Money.StackExchange.PostHistory',* FROM OPENROWSET(
   BULK 'E:\Downloads\Money.StackExchange\PostHistory.xml',
   SINGLE_BLOB) AS x;

INSERT INTO StackExchange_Source_Raw
(SourceName,XmlCol)
SELECT 'Money.StackExchange.PostLinks',* FROM OPENROWSET(
   BULK 'E:\Downloads\Money.StackExchange\PostLinks.xml',
   SINGLE_BLOB) AS x;

INSERT INTO StackExchange_Source_Raw
(SourceName,XmlCol)
SELECT 'Money.StackExchange.Posts',* FROM OPENROWSET(
   BULK 'E:\Downloads\Money.StackExchange\Posts.xml',
   SINGLE_BLOB) AS x;

INSERT INTO StackExchange_Source_Raw
(SourceName,XmlCol)
SELECT 'Money.StackExchange.Tags',* FROM OPENROWSET(
   BULK 'E:\Downloads\Money.StackExchange\Tags.xml',
   SINGLE_BLOB) AS x;

INSERT INTO StackExchange_Source_Raw
(SourceName,XmlCol)
SELECT 'Money.StackExchange.Users',* FROM OPENROWSET(
   BULK 'E:\Downloads\Money.StackExchange\Users.xml',
   SINGLE_BLOB) AS x;

INSERT INTO StackExchange_Source_Raw
(SourceName,XmlCol)
SELECT 'Money.StackExchange.Votes',* FROM OPENROWSET(
   BULK 'E:\Downloads\Money.StackExchange\Votes.xml',
   SINGLE_BLOB) AS x;

--Select XML
select * from StackExchange_Source_Raw;

--Select XML Badges
Select 
 r.SourceName
 ,t2.Badges.query('.') as BadgeRowXml
 ,t2.Badges.value('./@Id','int') as BadgeId
 ,t2.Badges.value('./@UserId','int') as BadgeUserId
 ,t2.Badges.value('./@Name','varchar(55)') as BadgeName
 ,t2.Badges.value('./@Date','datetime') as BadgeDate
into Money_StackExchange_Badges
from StackExchange_Source_Raw r
cross apply XmlCol.nodes('/badges/row') as T2(Badges)
where r.SourceName='Money.StackExchange.Badges';

--Select XML Comments
Select 
 r.SourceName
 ,t2.Comment.query('.') as CommentsRowXml
 ,t2.Comment.value('./@Id','int') as CommentsId
 ,t2.Comment.value('./@UserId','int') as CommentsUserId
 ,t2.Comment.value('./@PostId','int') as CommentsPostId
 ,t2.Comment.value('./@Text','varchar(max)') as CommentsText
 ,t2.Comment.value('./@CreationDate','datetime') as CommentsCreationDate
into Money_StackExchange_Comments
from StackExchange_Source_Raw r
cross apply XmlCol.nodes('/comments/row') as T2(Comment)
where r.SourceName='Money.StackExchange.Comments';

--Select XML PostHistory
Select 
 r.SourceName
 ,t2.PostHistory.query('.') as PostHistoryRowXml
 ,t2.PostHistory.value('./@Id','int') as PostHistoryId
 ,t2.PostHistory.value('./@PostHistoryTypeId','int') as PostHistoryTypeId
 ,t2.PostHistory.value('./@PostId','int') as PostHistoryPostId
 ,t2.PostHistory.value('./@UserId','int') as PostHistoryUserId
 ,t2.PostHistory.value('./@Text','varchar(max)') as PostHistoryText
 ,t2.PostHistory.value('./@CreationDate','datetime') as PostHistoryCreationDate
 ,t2.PostHistory.value('./@UserDisplayName','varchar(max)') as PostHistoryDisplayName
 ,t2.PostHistory.value('./@Comment','varchar(max)') as PostHistoryComment
 ,t2.PostHistory.value('./@RevisionGUID','uniqueidentifier') as PostHistoryRevisionGuid
into Money_StackExchange_PostHistory
from StackExchange_Source_Raw r
cross apply XmlCol.nodes('/posthistory/row') as T2(PostHistory)
where r.SourceName='Money.StackExchange.PostHistory';

--Select XML PostLinks
Select 
 r.SourceName
 ,t2.PostLink.query('.') as PostLinkRowXml
 ,t2.PostLink.value('./@Id','int') as PostLinkId
 ,t2.PostLink.value('./@LinkTypeId','int') as PostLinkTypeId
 ,t2.PostLink.value('./@PostId','int') as PostLinkPostId
 ,t2.PostLink.value('./@RelatedPostId','int') as PostLinkRelatedPostId
 ,t2.PostLink.value('./@CreationDate','datetime') as PostLinkCreationDate
into Money_StackExchange_PostLinks
from StackExchange_Source_Raw r
cross apply XmlCol.nodes('/postlinks/row') as T2(PostLink)
where r.SourceName='Money.StackExchange.PostLinks';

--Select XML Posts
Select 
 r.SourceName
 ,t2.Post.query('.') as PostRowXml
 ,t2.Post.value('./@Id','int') as PostId
 ,t2.Post.value('./@ParentId','int') as PostParentId
 ,t2.Post.value('./@PostTypeId','int') as PostTypeId
 ,t2.Post.value('./@AcceptedAnswerId','int') as PostAcceptedAnswerId
 ,t2.Post.value('./@CreationDate','datetime') as PostCreationDate
 ,t2.Post.value('./@Score','int') as PostScore
 ,t2.Post.value('./@ViewCount','int') as PostViewCount
 ,t2.Post.value('./@Body','varchar(max)') as PostBody
 ,t2.Post.value('./@OwnerUserId','int') as PostOwnerUserId
 ,t2.Post.value('./@OwnerDisplayName','varchar(max)') as PostOwnerDisplayName
 ,t2.Post.value('./@LastEditorUserId','int') as PostLastEditorUserId
 ,t2.Post.value('./@LastEditorDisplayName','varchar(max)') as PostLastEditorDisplayName
 ,t2.Post.value('./@LastEditDate','datetime') as PostLastEditDate
 ,t2.Post.value('./@LastActivityDate','datetime') as PostLastActivityDate
 ,t2.Post.value('./@Title','varchar(max)') as PostTitle
 ,t2.Post.value('./@Tags','varchar(max)') as PostTags
,t2.Post.value('./@AnswerCount','int') as PostAnswerCount
,t2.Post.value('./@CommentCount','int') as PostCommentCount
,t2.Post.value('./@FavoriteCount','int') as PostFavoriteCount
into Money_StackExchange_Posts
from StackExchange_Source_Raw r
cross apply XmlCol.nodes('/posts/row') as T2(Post)
where r.SourceName='Money.StackExchange.Posts';


--Select XML Tags
Select 
 r.SourceName
 ,t2.tags.query('.') as TagRowXml
 ,t2.tags.value('./@Id','int') as TagId
 ,t2.tags.value('./@TagName','varchar(max)') as TagName
 ,t2.tags.value('./@ExcerptPostId','int') as TagExcerptPostId
 ,t2.tags.value('./@WikiPostId','int') as TagWikiPostId
 ,t2.tags.value('./@Count','int') as TagCount
into Money_StackExchange_Tags
from StackExchange_Source_Raw r
cross apply XmlCol.nodes('/tags/row') as T2(tags)
where r.SourceName='Money.StackExchange.Tags';


--Select XML Users
Select 
 r.SourceName
 ,t2.users.query('.') as UserRowXml
 ,t2.users.value('./@Id','int') as UserId
 ,t2.users.value('./@Reputation','int') as UserReputation
 ,t2.users.value('./@CreationDate','datetime') as UserCreationDate
 ,t2.users.value('./@DisplayName','varchar(max)') as UserDisplayName
 ,t2.users.value('./@LastAccessDate','datetime') as UserLastAccessDate
 ,t2.users.value('./@WebsiteUrl','varchar(max)') as UserWebsiteUrl
 ,t2.users.value('./@Location','varchar(max)') as UserLocation
 ,t2.users.value('./@AboutMe','varchar(max)') as UserAboutMe
 ,t2.users.value('./@Views','int') as UserViews
 ,t2.users.value('./@UpVotes','int') as UserUpVotes
 ,t2.users.value('./@DownVotes','int') as UserDownVotes
 ,t2.users.value('./@AccountId','int') as UserAccountId
into Money_StackExchange_Users
from StackExchange_Source_Raw r
cross apply XmlCol.nodes('/users/row') as T2(users)
where r.SourceName='Money.StackExchange.Users';


--Select XML Votes
Select 
 r.SourceName
 ,t2.votes.query('.') as VoteRowXml
 ,t2.votes.value('./@Id','int') as VoteId
 ,t2.votes.value('./@UserId','int') as UserId
 ,t2.votes.value('./@PostId','int') as VotePostId
 ,t2.votes.value('./@VoteTypeId','int') as VoteTypeId
 ,t2.votes.value('./@CreationDate','datetime') as CreationDate
into Money_StackExchange_Votes
from StackExchange_Source_Raw r
cross apply XmlCol.nodes('/votes/row') as T2(votes)
where r.SourceName='Money.StackExchange.Votes';
