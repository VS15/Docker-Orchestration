<p class=MsoNormal style='text-align:justify;text-justify:inter-ideograph'><b
style='mso-bidi-font-weight:normal'><span style='font-size:16.0pt;font-family:
"Times New Roman"'>Automated Orchestration with <span class=SpellE>Docker</span>
Swarm v1.13, Jenkins 2.32 and <span class=SpellE>RancherOS</span> server:</span></b><span
style='font-size:16.0pt;font-family:"Times New Roman"'><o:p></o:p></span></p>

<p class=MsoNormal style='text-align:justify;text-justify:inter-ideograph'><b
style='mso-bidi-font-weight:normal'><span style='font-size:14.0pt;font-family:
"Times New Roman"'>----------------------------------------------------------------------------------------------------------------<o:p></o:p></span></b></p>

<p class=MsoNormal style='text-align:justify;text-justify:inter-ideograph'><span
class=GramE><span style='font-size:14.0pt;font-family:"Times New Roman"'>Prerequisites
for this deployment is</span></span><span style='font-size:14.0pt;font-family:
"Times New Roman"'> <span class=SpellE><b style='mso-bidi-font-weight:normal'>Docker</b></span><b
style='mso-bidi-font-weight:normal'> Platform</b> v1.12+: <a
href="https://www.docker.com/products/docker">https://www.docker.com/products/docker</a><o:p></o:p></span></p>

<p class=MsoNormal><b style='mso-bidi-font-weight:normal'><span
style='font-size:14.0pt;font-family:"Times New Roman"'>The main purpose of this
project is to automatically create a highly available and easy scalable Jenkins
Build farm. <o:p></o:p></span></b></p>

<p class=MsoNormal style='text-align:justify;text-justify:inter-ideograph'><span
style='font-size:14.0pt;font-family:"Times New Roman"'>1. Once you run <span
class=GramE>the ./</span>intiate_swarm_cluster.sh script it will automatically
spin up 3 virtual machines by using <span class=SpellE><b style='mso-bidi-font-weight:
normal'>docker</b></span><b style='mso-bidi-font-weight:normal'>-machine.<o:p></o:p></b></span></p>

<p class=MsoNormal style='text-align:justify;text-justify:inter-ideograph'><span
style='font-size:14.0pt;font-family:"Times New Roman"'>2. On the second step it
will create a <span class=SpellE><b style='mso-bidi-font-weight:normal'>docker</b></span><b
style='mso-bidi-font-weight:normal'> swarm</b> cluster with 1 leader and 2
workers. <span style="mso-spacerun:yes">&nbsp;</span><o:p></o:p></span></p>

<p class=MsoNormal style='text-align:justify;text-justify:inter-ideograph'><span
style='font-size:14.0pt;font-family:"Times New Roman"'>3. By using <span
class=SpellE>docker</span>-network it will create two software-defined
networks: <b style='mso-bidi-font-weight:normal'>proxy</b> and <b
style='mso-bidi-font-weight:normal'>service-net-1</b><o:p></o:p></span></p>

<p class=MsoNormal style='text-align:justify;text-justify:inter-ideograph'><span
style='font-size:14.0pt;font-family:"Times New Roman"'>4. <span class=SpellE><b
style='mso-bidi-font-weight:normal'>Docker</b></span><b style='mso-bidi-font-weight:
normal'>-service </b>will create 2 services running within the <span
class=SpellE>docker</span>-swarm cluster: Jenkins and <span class=SpellE>RancherOS</span>.
These services are highly available. If one service crashes the swarm will
automatically spin a new copy of it. All services are attached to both SDNs and
user traffic is routed to them disregarding the node processing the request,
meaning that services are technically load-balanced.<o:p></o:p></span></p>

<p class=MsoNormal style='text-align:justify;text-justify:inter-ideograph'><b
style='mso-bidi-font-weight:normal'><span style='font-size:14.0pt;font-family:
"Times New Roman"'>---------------------------------------------------------------------------------------------------------------<o:p></o:p></span></b></p>

<p class=MsoNormal style='text-align:justify;text-justify:inter-ideograph'><b
style='mso-bidi-font-weight:normal'><span style='font-size:17.0pt;font-family:
"Times New Roman"'>How to section: <o:p></o:p></span></b></p>

<p class=MsoListParagraphCxSpFirst style='text-align:justify;text-justify:inter-ideograph;
text-indent:-.25in;mso-list:l2 level1 lfo3'><![if !supportLists]><span
style='font-size:14.0pt;font-family:Symbol;mso-fareast-font-family:Symbol;
mso-bidi-font-family:Symbol'><span style='mso-list:Ignore'>á<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><![endif]><span
style='font-size:14.0pt;font-family:"Times New Roman"'>To auto-deploy and
configure the cluster execute the following<span class=GramE>: ./</span>intiate_swarm_cluster.sh<o:p></o:p></span></p>

<p class=MsoListParagraphCxSpMiddle style='text-align:justify;text-justify:
inter-ideograph;text-indent:-.25in;mso-list:l2 level1 lfo3'><![if !supportLists]><span
style='font-size:14.0pt;font-family:Symbol;mso-fareast-font-family:Symbol;
mso-bidi-font-family:Symbol'><span style='mso-list:Ignore'>á<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><![endif]><span
style='font-size:14.0pt;font-family:"Times New Roman"'>You will need to
configure <span class=SpellE>jenkins</span> on the initial startup and install
Jenkins Self-Organizing Swarm Plug-in Modules plugin in Plugin manager and
restart Jenkins (please create <span class=SpellE><b style='mso-bidi-font-weight:
normal'>admin<span class=GramE>:admin</span></b></span> user). Navigate to this
link: <b style='mso-bidi-font-weight:normal'>http://192.168.99.102:8082/jenkins/</b><o:p></o:p></span></p>

<p class=MsoListParagraphCxSpMiddle style='text-align:justify;text-justify:
inter-ideograph;text-indent:-.25in;mso-list:l2 level1 lfo3'><![if !supportLists]><span
style='font-size:14.0pt;font-family:Symbol;mso-fareast-font-family:Symbol;
mso-bidi-font-family:Symbol'><span style='mso-list:Ignore'>á<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><![endif]><span
style='font-size:14.0pt;font-family:"Times New Roman"'>Once Jenkins has been
configured, please execute the <span class=SpellE>jenkins</span>-slaves script
to deploy <span class=SpellE>docker</span> container based slaves with
auto-discovery<span class=GramE>: ./</span>deploy_jenkins_slave_service.sh<o:p></o:p></span></p>

<p class=MsoListParagraphCxSpMiddle style='text-align:justify;text-justify:
inter-ideograph;text-indent:-.25in;mso-list:l2 level1 lfo3'><![if !supportLists]><span
style='font-size:14.0pt;font-family:Symbol;mso-fareast-font-family:Symbol;
mso-bidi-font-family:Symbol'><span style='mso-list:Ignore'>á<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><![endif]><span
style='font-size:14.0pt;font-family:"Times New Roman"'>Swarm cluster summary
will be printed to the terminal once the deployment is complete, including the
Jenkins initiation password<o:p></o:p></span></p>

<p class=MsoListParagraphCxSpMiddle style='text-align:justify;text-justify:
inter-ideograph;text-indent:-.25in;mso-list:l2 level1 lfo3'><![if !supportLists]><span
style='font-size:14.0pt;font-family:Symbol;mso-fareast-font-family:Symbol;
mso-bidi-font-family:Symbol'><span style='mso-list:Ignore'>á<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><![endif]><span
style='font-size:14.0pt;font-family:"Times New Roman"'>To access <span
class=SpellE>RancherOS</span> server console navigate to this link: <b
style='mso-bidi-font-weight:normal'>http://192.168.99.102:8081/</b><o:p></o:p></span></p>

<p class=MsoListParagraphCxSpMiddle style='text-align:justify;text-justify:
inter-ideograph;text-indent:-.25in;mso-list:l2 level1 lfo3'><![if !supportLists]><span
style='font-size:14.0pt;font-family:Symbol;mso-fareast-font-family:Symbol;
mso-bidi-font-family:Symbol'><span style='mso-list:Ignore'>á<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><![endif]><span
style='font-size:14.0pt;font-family:"Times New Roman"'>To scale the service you
can execute the following command: <span class=SpellE>eval</span> $(<span
class=SpellE>docker</span>-machine <span class=SpellE>env</span> swarm-node-1)
&amp;&amp; <span class=SpellE>docker</span> service scale service=number of
instances<o:p></o:p></span></p>

<p class=MsoListParagraphCxSpLast style='text-align:justify;text-justify:inter-ideograph;
text-indent:-.25in;mso-list:l2 level1 lfo3'><![if !supportLists]><span
style='font-size:14.0pt;font-family:Symbol;mso-fareast-font-family:Symbol;
mso-bidi-font-family:Symbol'><span style='mso-list:Ignore'>á<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><![endif]><span
style='font-size:14.0pt;font-family:"Times New Roman"'>To terminate the swarm
cluster execute the following<span class=GramE>: <b style='mso-bidi-font-weight:
normal'>./</b></span><b style='mso-bidi-font-weight:normal'>terminate_swarm_cluster.sh<o:p></o:p></b></span></p>

</div>

</body>

</html>
