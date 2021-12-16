# AutoIssueSSLCert
Automatically apply for SSL certificate through ACME.SH

## Text Guide

1. Fork this repo
1. Modify '.github/workflows/AutoIssueSSLCert.yml' according to the notes
1. Add the following secret
1. Create secret 'DNSAPI'  
export DP_Id="xxx"  
export DP_Key="xxx"  
export CF_Token="xxx"  
export CF_Account_ID="xxx"  
1. Create secret 'ACMEMAIL'  
Your email address  
1. Create secret 'ZIPPWD'  
The zip file password you set yourself  
1. Go to the **Action** tab in your forked repo
    ![Action Tab](https://docs.github.com/assets/images/help/repository/actions-tab.png)
1. Click star in your forked repo
1. Wait for the end of the run

1. Download 'AutoIssueSSLCert.sh' to your server
1. Modify 'AutoIssueSSLCert.sh' according to the notes
1. Use crontab or other tools to execute 'AutoIssueSSLCert.sh' regularly
1. Configure appropriate periodic execution times
