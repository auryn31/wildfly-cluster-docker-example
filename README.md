# wildfly-docker-multicast-test

## ISSUE: The wildflys do not create a cluster via mutlicast
- the two wildflys cannot talk to each other
- they receive a cluster message
- they only connect to themself:
    - ` wildfly2_1  | 09:23:09,818 INFO  [org.infinispan.CLUSTER] (MSC service thread 1-1) ISPN000094: Received new cluster view for channel ejb: [wildfly_2_test|0] (1) [wildfly_2_test] `
    - ` wildfly2_1  | 09:23:09,811 INFO  [org.infinispan.CLUSTER] (MSC service thread 1-6) ISPN000094: Received new cluster view for channel ejb: [wildfly_2_test|0] (1) [wildfly_2_test]`
    - ` wildfly2_1  | 09:23:09,811 INFO  [org.infinispan.CLUSTER] (MSC service thread 1-4) ISPN000094: Received new cluster view for channel ejb: [wildfly_2_test|0] (1) [wildfly_2_test] `
    - `wildfly2_1  | 09:23:09,818 INFO  [org.infinispan.CLUSTER] (MSC service thread 1-8) ISPN000094: Received new cluster view for channel ejb: [wildfly_2_test|0] (1) [wildfly_2_test]`

- the first does the same with only wildfly_1_test