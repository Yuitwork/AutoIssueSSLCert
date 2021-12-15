# AutoIssueSSLCert
Automatically apply for SSL certificate through ACME.SH

## Text Guide

1. Fork this repo
1. Modification .github/workflows/AutoIssueSSLCert.yml
1. Replace 'domain.com' with your own domain name.
1. Replace '[DNS]' with the DNS provider used for your own domain name.
1. Replace 'you@example.com' and 'yourname' with your own email and user name
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
