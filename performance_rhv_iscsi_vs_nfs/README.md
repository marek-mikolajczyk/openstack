
# nas direct lun scsi
```
[root@openstack iscsi]# dd if=/dev/zero of=/disktest/iscsi/test_iscsi conv=fdatasync bs=384k count=1k; rm -f /disktest/iscsi/test_iscsi
1024+0 records in
1024+0 records out
402653184 bytes (403 MB, 384 MiB) copied, 5.37054 s, 75.0 MB/s
```

# nas nfs
```
dd if=/dev/zero of=/disktest/nfs/test_nfs conv=fdatasync bs=384k count=1k; rm -f /disktest/nfs/test_nfs
[root@openstack iscsi]# dd if=/dev/zero of=/disktest/nfs/test_nfs conv=fdatasync bs=384k count=1k; rm -f /disktest/nfs/test_nfs
1024+0 records in
1024+0 records out
402653184 bytes (403 MB, 384 MiB) copied, 12.6267 s, 31.9 MB/s
```

# local ssd from nfs storage domain
```
[root@openstack iscsi]# dd if=/dev/zero of=/tmp/local_ssd_from_nfs conv=fdatasync bs=384k count=1k; rm -f /tmp/local_ssd_from_nfs conv=fdatasync
1024+0 records in
1024+0 records out
402653184 bytes (403 MB, 384 MiB) copied, 4.79847 s, 83.9 MB/s
```



server throughput
# nas direct lun scsi
dd if=/dev/zero of=/disktest/iscsi/test_iscsi.img bs=1G count=1 oflag=dsync; rm -f /disktest/iscsi/test_iscsi.img
1073741824 bytes (1.1 GB, 1.0 GiB) copied, 15.8055 s, 67.9 MB/s
# nas nfs
dd if=/dev/zero of=/disktest/nfs/test_nfs.img bs=1G count=1 oflag=dsync; rm -f /disktest/nfs/test_nfs.img
1073741824 bytes (1.1 GB, 1.0 GiB) copied, 39.204 s, 27.4 MB/s
# local ssd from nfs storage domain
dd if=/dev/zero of=/tmp/local_ssd_from_nfs conv=fdatasync bs=1G count=1 oflag=dsync; rm -f /tmp/local_ssd_from_nfs conv=fdatasync
1073741824 bytes (1.1 GB, 1.0 GiB) copied, 12.8193 s, 83.8 MB/s

 

server latency
# nas direct lun scsi
dd if=/dev/zero of=/disktest/iscsi/test_iscsi.img bs=512 count=1000 oflag=dsync ; rm -f /disktest/iscsi/test_iscsi.img
512000 bytes (512 kB, 500 KiB) copied, 2.19119 s, 234 kB/s
# nas nfs
dd if=/dev/zero of=/disktest/nfs/test_nfs.img bs=512 count=1000 oflag=dsync ; rm -f /disktest/nfs/test_nfs.img
512000 bytes (512 kB, 500 KiB) copied, 88.0075 s, 5.8 kB/s
# local ssd from nfs storage domain
dd if=/dev/zero of=/tmp/local_ssd_from_nfs bs=512 count=1000 oflag=dsync ; rm -f /tmp/local_ssd_from_nfs
512000 bytes (512 kB, 500 KiB) copied, 1.75572 s, 292 kB/s