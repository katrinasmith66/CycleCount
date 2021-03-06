﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cs_UserControlWithAudio.aspx.cs" Inherits="Captcha_cs_UserControlWithAudio" %>
<%@ Register Src="UserControls/MyCaptchaWithAudio.ascx" TagName="Captcha" TagPrefix="site" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head runat="server">
    <title>obout Captcha - in UserControl</title>
    <style type="text/css">
            a {
                   font-size:10pt;font-family:Tahoma
            }
            a:hover {
                   color:crimson;
            }
            .tdText {
                    font:11px Verdana;
                    color:#333333;
            }
    </style>
</head>
<body style="font:12px Verdana;">
<script type="text/JavaScript">
    // on page load - called by ScriptManager
    function pageLoad() {
        // handler for request invoking
        function invokingRequest(sender, args) {
            // remove the request invoking handler
            // (it will be added again on the next pageLoad() call after partial postback)
            Sys.Net.WebRequestManager.remove_invokingRequest(invokingRequest);
            // activate the Captcha's progress
            $find("<%= Captcha1.CaptchaImage.ClientID %>").beginProgress();
        }
        // add the request invoking handler
        Sys.Net.WebRequestManager.add_invokingRequest(invokingRequest);
    }
</script>
    <span class="tdText"><b>Obout.Ajax.UI.Captcha</b> - In UserControl with Audio feature</span>
    <br /><br />
    <form id="form1" runat="server">
        <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />

        <asp:UpdatePanel ID="updatePanel1" runat="server">
            <ContentTemplate>
                <b>Registration Form</b><br /><br />
                <obout:OboutTextBox runat="server" ID="FirstName" WatermarkText="First name" Width="223"
                    FolderStyle="../interface/styles/black_glass/OboutTextBox" /> *
                <asp:RequiredFieldValidator ID="FirstValidator" runat="server" ControlToValidate="FirstName"
                    EnableClientScript="true" ValidationGroup="SubmitInfo" InitialValue="First name"
                    ErrorMessage="Please fill in first name!" Display="Dynamic" /><br />
                <obout:OboutTextBox runat="server" ID="LastName" WatermarkText="Last name" Width="223" /> *
                <asp:RequiredFieldValidator ID="LastValidator" runat="server" ControlToValidate="LastName"
                    EnableClientScript="true" ValidationGroup="SubmitInfo" InitialValue="Last name"
                    ErrorMessage="Please fill in last name!" Display="Dynamic" />
                <site:Captcha runat="server" ID="Captcha1" ValidationGroup="SubmitInfo" /><br />
                <asp:Button runat="server" Text="Submit the form" ValidationGroup="SubmitInfo" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
    <br /><br /><a href="Default.aspx?type=CSHARP">< Back to examples</a>
</body>
</html>
