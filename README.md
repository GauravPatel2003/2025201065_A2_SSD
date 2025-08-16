This project contains SQL procedures to manage subscribers and track their watch history. Below is a summary of each file and what it does.

---

## Q1.SQL – find\_subscriber\_name()

**What it does:**

* Loops through all subscribers using a cursor.
* Inserts subscriber names into a temporary table.
* Prints all subscriber names.

**How to do:**

```sql
CALL find_subscriber_name();
```

---

## Q2.SQL – GetWatchHistoryBySubscriber(IN sub\_id INT)

**What it does:**

* Retrieves the watch history of a given subscriber.
* Joins WatchHistory, Shows, and Subscribers tables to get Show Title and Watch Time.

**How to do:**

```sql
CALL GetWatchHistoryBySubscriber(Subscriber ID);
```

---

## Q3.SQL – AddSubscriberIfNotExists(IN subName VARCHAR(100))

**What it does:**

* Checks if a subscriber already exists.
* If not, adds the subscriber.
* Otherwise, prints a message that the subscriber exists.

**How to do:**

```sql
CALL AddSubscriberIfNotExists(Subscriber Name);
```

---

## Q4.SQL – SendWatchTimeReport()

**What it does:**

* Loops through all subscribers with WatchTime > 0 using a cursor.
* Calls `GetWatchHistoryBySubscriber(sub_id)` for each subscriber.
* Prints their watch history.

**How to do:**

```sql
CALL SendWatchTimeReport();
```

---

## Q5.SQL – SendData()

**What it does:**

* Loops through all subscribers using a cursor.
* Calculates total watch time per subscriber.
* Prints subscriber info along with total watch time.
* Calls `GetWatchHistoryBySubscriber(sub_id)` for detailed watch records.

**How to do:**

```sql
CALL SendData();
```

---

**Note:**
All procedures demonstrate the use of cursors, temporary tables, stored procedure calls, and aggregation to generate reports for subscribers and their watch history.
