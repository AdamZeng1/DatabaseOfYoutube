# 关于Youtube数据库设计的看法

1. 该数据库中包含了一对多，多对多使用中间表相连，还有自连接（self reference）等等方式来表现实体之间相对复杂的关系。
2. 使用ON DELETE CASCADE,使得多个表中具有reference的数据能够同步被删除。
3. 完成了某些视图的创建。

![avatar](https://github.com/AdamZeng1/DatabaseOfYoutube/blob/master/image/1.png)

![avatar](https://github.com/AdamZeng1/DatabaseOfYoutube/blob/master/image/2.png)

