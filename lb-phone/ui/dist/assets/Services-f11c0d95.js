import{r as S,j as e,a as s,F}from"./jsx-runtime-f40812bf.js";import{b as g,f as v,L as t,C as b,h as k,u as X,I as q,n as L,bq as B,bd as w,k as J,R as K,c as M,W as z,X as y,Y as Q,_,aX as G,br as Z,q as ee,bs as te,g as x,p as ae,a8 as j,o as ne,bt as ie}from"./Phone-eb89da6c.js";import{r as H}from"./number-28525126.js";function se(){var u,E,h,O,N,l,m,n;const c=g(k),[a,d]=S.useState(null),[A,o]=S.useState(null);return S.useEffect(()=>{v("Services",{action:"getCompany"}).then(i=>{i&&d(i)})},[]),e("div",{className:"animation-slide right",children:a!=null&&a.job?s("div",{className:"actions-container",children:[a.duty!==void 0&&((E=(u=c==null?void 0:c.Companies)==null?void 0:u.Management)==null?void 0:E.Duty)!==!1&&s("section",{children:[e("div",{className:"title",children:t("APPS.SERVICES.DUTY")}),e("div",{className:"content","data-clickable":"true",onClick:()=>{v("Services",{action:"toggleDuty",duty:!a.duty}).then(()=>{d({...a,duty:!a.duty})})},children:e("div",{className:"item single",children:e("div",{className:"value",children:a.duty?t("APPS.SERVICES.GO_OFF_DUTY"):t("APPS.SERVICES.GO_ON_DUTY")})})})]}),a.isBoss&&s(F,{children:[s("section",{children:[e("div",{className:"title",children:t("APPS.SERVICES.ACTIONS")}),s("div",{className:"content",children:[s("div",{className:"item",children:[e("div",{className:"title",children:t("APPS.SERVICES.BALANCE")}),e("div",{className:"value",children:c.CurrencyFormat.replace("%s",a.balance)})]}),s("div",{className:"row",children:[((O=(h=c==null?void 0:c.Companies)==null?void 0:h.Management)==null?void 0:O.Deposit)!==!1&&s("div",{className:"item","data-col":2,onClick:()=>{b.PopUp.set({title:t("APPS.SERVICES.DEPOSIT_POPUP.TITLE"),description:t("APPS.SERVICES.DEPOSIT_POPUP.DESCRIPTION"),input:{placeholder:t("APPS.SERVICES.DEPOSIT_POPUP.AMOUNT"),onChange:i=>{o(i)},type:"number"},buttons:[{title:t("APPS.SERVICES.DEPOSIT_POPUP.CANCEL")},{title:t("APPS.SERVICES.DEPOSIT_POPUP.PROCEED"),cb:()=>{o(i=>{/^\d+$/.test(i)&&v("Services",{action:"depositMoney",amount:parseInt(i)}).then(P=>{P&&d({...a,balance:P})})})}}]})},children:[e("div",{className:"title"}),e("div",{className:"value",children:t("APPS.SERVICES.DEPOSIT_POPUP.TITLE")})]}),((l=(N=c==null?void 0:c.Companies)==null?void 0:N.Management)==null?void 0:l.Withdraw)!==!1&&s("div",{className:"item","data-col":2,onClick:()=>{b.PopUp.set({title:t("APPS.SERVICES.WITHDRAW_POPUP.TITLE"),description:t("APPS.SERVICES.WITHDRAW_POPUP.DESCRIPTION"),input:{placeholder:t("APPS.SERVICES.WITHDRAW_POPUP.AMOUNT"),onChange:i=>{o(i)},type:"number"},buttons:[{title:t("APPS.SERVICES.WITHDRAW_POPUP.CANCEL")},{title:t("APPS.SERVICES.WITHDRAW_POPUP.PROCEED"),cb:()=>{o(i=>{/^\d+$/.test(i)&&v("Services",{action:"withdrawMoney",amount:parseInt(i)}).then(P=>{P&&d({...a,balance:P})})})}}]})},children:[e("div",{className:"title"}),e("div",{className:"value",children:t("APPS.SERVICES.WITHDRAW_POPUP.TITLE")})]})]})]})]}),s("section",{children:[e("div",{className:"title",children:t("APPS.SERVICES.MANAGE_EMPLOYEES")}),s("div",{className:"content","data-clickable":c.Companies.Management.Fire!==!1||c.Companies.Management.Promote!==!1||c.Companies.Management.Hire!==!1,children:[((n=(m=c==null?void 0:c.Companies)==null?void 0:m.Management)==null?void 0:n.Hire)!==!1&&e("div",{className:"item single",onClick:()=>{b.PopUp.set({title:t("APPS.SERVICES.HIRE_POPUP.TITLE"),description:t("APPS.SERVICES.HIRE_POPUP.DESCRIPTION"),input:{placeholder:t("APPS.SERVICES.HIRE_POPUP.PLACEHOLDER"),onChange:i=>{o(i)},type:"number"},buttons:[{title:t("APPS.SERVICES.HIRE_POPUP.CANCEL")},{title:t("APPS.SERVICES.HIRE_POPUP.PROCEED"),cb:()=>{o(i=>{if(/^\d+$/.test(i))return v("Services",{action:"hireEmployee",source:parseInt(i)}).then(P=>{P&&d({...a,employees:[...a.employees,{id:P.id,name:P.name,grade:0,gradeLabel:a.grades[0].label,canInteract:!0}]})}),""})}}]})},children:e("div",{className:"value",children:t("APPS.SERVICES.HIRE")})}),a.employees.map((i,P)=>s("div",{className:"item",onClick:()=>{if(!i.canInteract||c.Companies.Management.Fire===!1&&c.Companies.Management.Promote===!1)return;const I=[c.Companies.Management.Promote!==!1&&{title:t("APPS.SERVICES.SET_GRADE"),cb:()=>{setTimeout(()=>{b.ContextMenu.set({buttons:[...a.grades.map((p,R)=>({title:p.label,cb:()=>{v("Services",{action:"setGrade",employee:i.id,grade:p.grade}).then(D=>{D&&d({...a,employees:a.employees.map(T=>(T.id===i.id&&(T.grade=p.grade,T.gradeLabel=p.label),T))})})}}))]})},300)}},c.Companies.Management.Fire!==!1&&{title:t("APPS.SERVICES.FIRE_POPUP.TITLE"),color:"red",cb:()=>{b.PopUp.set({title:t("APPS.SERVICES.FIRE_POPUP.TITLE"),description:t("APPS.SERVICES.FIRE_POPUP.DESCRIPTION").format({name:i.name}),buttons:[{title:t("APPS.SERVICES.FIRE_POPUP.CANCEL")},{title:t("APPS.SERVICES.FIRE_POPUP.PROCEED"),color:"red",cb:()=>{v("Services",{action:"fireEmployee",employee:i.id}).then(()=>{d({...a,employees:a.employees.filter(p=>p.id!==i.id)})})}}]})}}];b.ContextMenu.set({buttons:I.filter(p=>p)})},children:[e("div",{className:"title",children:i.gradeLabel}),e("div",{className:"value",children:i.name})]},P))]})]})]})]}):e("div",{className:"no-job",children:t("APPS.SERVICES.UNEMPLOYED")})})}function ce(){const{View:c,Data:a}=S.useContext(V),d=g(M.Settings),A=g(M.PhoneNumber),[o,u]=a,[E,h]=c,[O,N]=S.useState(0),[l,m]=S.useState(!1),[n,i]=S.useState(!1),[P,I]=S.useState([]),p=S.useRef(null),[R,D]=S.useState({content:"",attachments:[]});S.useEffect(()=>{v("Services",{action:"getMessages",page:0,id:o.id,company:o.job}).then(r=>{if(r&&r.length>0){I([...r.reverse()]);let C=document.querySelector(".chat-container");C.scrollTop=C.scrollHeight}else m(!0)})},[]);const T=()=>{if(R.content.length>0){let r={sender:A,id:o.id,company:o.job,content:R.content,timestamp:new Date};if(d.airplaneMode)return I(C=>[...C,{...r,delivered:!1}]);v("Services",{action:"sendMessage",...r}).then(C=>{I(C?f=>[...f,r]:f=>[...f,{...r,delivered:!1}]),D({content:"",attachments:[]}),p.current.value=""})}},W=()=>{b.PopUp.set({title:t("APPS.MESSAGES.SEND_LOCATION_POPUP.TITLE"),description:t("APPS.MESSAGES.SEND_LOCATION_POPUP.TEXT"),buttons:[{title:t("APPS.MESSAGES.SEND_LOCATION_POPUP.CANCEL")},{title:t("APPS.MESSAGES.SEND_LOCATION_POPUP.SEND"),cb:()=>{v("Maps",{action:"getCurrentLocation"}).then(r=>{if(!r)return;let C={sender:A,content:`<!SENT-LOCATION-X=${H(r.x,2)}Y=${H(r.y,2)}!>`,attachments:[],id:o.id,company:o.job,timestamp:new Date};v("Services",{action:"sendMessage",...C}).then(f=>{I(f?U=>[...U,C]:U=>[...U,{...C,delivered:!1}])})})}}]})},Y=()=>{if(l||n)return;let r=document.querySelector("#last");if(!r)return;!z(r)&&(i(!0),v("Services",{action:"getMessages",page:O+1,id:o.id,company:o.job}).then(f=>{f&&f.length>0?(I([...f.reverse(),...P]),i(!1),f.length<25&&m(!0)):m(!0)}),N(f=>f+1))};X("services:newMessage",r=>{if(o.id!==r.channelId||r.sender===A||d.airplaneMode)return;I([...P,{...r,timestamp:new Date}]);let C=document.querySelector(".chat-container");C.scrollTop=C.scrollHeight});const $=r=>{if(r)return/<!SENT-LOCATION-X=(-?\d*\.?\d*)Y=(-?\d*\.?\d*)!>/.test(r)};return e(F,{children:s("div",{className:"animation-slide left",children:[s("div",{className:"chat-header",children:[e("div",{className:"back",onClick:()=>{h("messages"),u(null)},children:e(q,{})}),s("div",{className:"user",children:[e("img",{src:o.icon??"./assets/img/no-pfp.png",className:"avatar"}),e("div",{className:"name",children:o.company??L(o.number)})]}),e(B,{className:"hidden"})]}),e("div",{className:"chat-container",onScroll:Y,children:e("div",{className:"chat-body",children:P.map((r,C)=>e(le,{index:C,messages:P,message:r,func:{isLocation:$}}))})}),s("div",{className:"chat-bottom",children:[e(w,{onClick:W}),s("div",{className:"input",children:[e(J,{placeholder:t("APPS.MESSAGES.PLACEHOLDER"),ref:p,value:R.content,onChange:r=>{D({content:r.target.value,attachments:R.attachments})},onKeyDown:r=>{r.key=="Enter"&&T()}}),R.content.length>0&&e("div",{className:"send",onClick:T,children:e(K,{})})]})]})]})})}const le=({messages:c,message:a,index:d,func:A})=>{var i;const{Data:o}=S.useContext(V);g(M.Settings);const u=g(M.PhoneNumber),[E]=o;let h,O,N,l=d===0?"last":"",m=a.sender===u?"self":"other",n=((i=c[d+1])==null?void 0:i.sender)===u?"self":"other";if(c[d+1]?O=Math.abs(a.timestamp-c[d+1].timestamp)/36e5:n=void 0,A.isLocation(a.content)){let P=a.content.match(/X=(-?\d*\.?\d*)Y/)[1],I=a.content.match(/Y=(-?\d*\.?\d*)!>/)[1];N={x:P,y:I}}return s("div",{className:`message ${m}`,id:l,"data-id":a.id,children:[h,a.delivered===!1?s("div",{className:"content-wrapper",children:[e("div",{className:"content",children:y(a.content)}),e(Q,{})]}):N?s("div",{className:"location",onClick:()=>{M.App.set({name:"Maps",data:{location:[N.y,N.x],name:`${L(a.sender)}'s location`,icon:E.icon}})},children:[e("div",{className:"img",style:{backgroundImage:'url("https://img.gta5-mods.com/q95/images/mirror-park-garden/2b72f9-20160428154103_1.jpg")'}}),m==="other"&&s("div",{className:"sender",children:[L(a.sender)," ",t("APPS.MESSAGES.SENT_LOCATION")]})]}):a.content&&e("div",{className:"content",children:y(a.content)}),a.delivered===!1?e("div",{className:"status",children:t("APPS.MESSAGES.NOT_DELIVERED")}):c[d+1]&&O>6?e("div",{className:"date",children:_(a.timestamp)}):m!==n&&e("div",{className:"date",children:_(a.timestamp)})]},d)};function oe(){const{View:c,Data:a}=S.useContext(V),[d,A]=c,[o,u]=a,E=g(k),[h,O]=S.useState([]);S.useEffect(()=>{v("Services",{action:"getCompanies"}).then(n=>{n&&O(n)})},[]);const N=n=>{var i;!((i=n==null?void 0:n.location)!=null&&i.coords)||!n.name||M.App.set({name:"Maps",data:{location:[n.location.coords.y,n.location.coords.x],name:n.name,icon:n.icon}})},l=(n,i)=>{E.Companies.Enabled&&b.PopUp.set({title:t("APPS.SERVICES.CALL_POPUP.TITLE"),description:t("APPS.SERVICES.CALL_POPUP.DESCRIPTION").format({name:x(n)}),buttons:[{title:t("APPS.SERVICES.CALL_POPUP.CANCEL")},{title:t("APPS.SERVICES.CALL_POPUP.PROCEED"),cb:()=>{ae({company:n,companylabel:i})}}]})},m=n=>{v("Services",{action:"getChannelId",company:n.job}).then(i=>{i&&(u({icon:n.icon,company:n.name,job:n.job,id:i}),A("chat"))})};return e("div",{className:"animation-slide right",children:e("div",{className:"companies-list",children:h.sort((n,i)=>n.open&&!i.open?-1:!n.open&&i.open?1:0).map((n,i)=>{var P,I,p,R;return s("div",{className:"item","data-open":n.open,children:[s("div",{className:"info",children:[n.icon&&e("div",{className:"icon",children:e("img",{src:n.icon})}),s("div",{className:"company-details",children:[e("div",{className:"title",children:n.name}),s("div",{className:"location",children:[e(G,{}),(P=n.location)==null?void 0:P.name]})]})]}),n.open?s("div",{className:"actions",children:[n.customIcon&&e("div",{className:"custom-icon",onClick:()=>v("Services",{action:"customIconClick",company:n.job}),children:Z[n.customIcon]()}),((I=n.location)==null?void 0:I.coords)&&e(w,{onClick:()=>N(n)}),((p=E.Companies)==null?void 0:p.Enabled)!==!1&&n.canCall!==!1&&e(ee,{onClick:()=>l(n.job,n.name)}),n.canMessage!==!1&&e(te,{onClick:()=>m(n)})]}):s("div",{className:"actions",children:[((R=n.location)==null?void 0:R.coords)&&e(w,{onClick:()=>N(n)}),t("APPS.SERVICES.CLOSED")]})]},i)})})})}function re(){const{View:c,Data:a}=S.useContext(V),d=g(M.PhoneNumber),[A,o]=c,[u,E]=a,[h,O]=S.useState({personal:[],job:[]});S.useEffect(()=>{v("Services",{action:"getRecentMessages",page:0}).then(l=>{l&&O({personal:[...l.filter(m=>m.number===d)],job:[...l.filter(m=>m.number!==d)]})})},[]);const N=l=>{if(l)return/<!SENT-LOCATION-X=(-?\d*\.?\d*)Y=(-?\d*\.?\d*)!>/.test(l)};return e("div",{className:"animation-slide right",children:s("div",{className:"company-messages-container",children:[s("section",{children:[e("div",{className:"title",children:t("APPS.SERVICES.YOUR_MESSAGES")}),e("div",{className:"content",children:h.personal&&h.personal.map((l,m)=>s("div",{className:"item",onClick:()=>{E({...u,icon:l.company.icon,company:l.company.name,job:l.company.job,id:l.id}),o("chat")},children:[e("img",{src:l.company.icon}),s("div",{className:"info",children:[s("div",{className:"info-header",children:[e("div",{className:"user",children:x(l.company.name)}),s("div",{className:"right",children:[e("div",{className:"time",children:_(l.timestamp)}),e(j,{})]})]}),e("div",{className:"message",children:N(l.lastMessage)?t("APPS.MESSAGES.SENT_LOCATION_SHORT"):l.lastMessage})]})]},m))})]}),s("section",{children:[e("div",{className:"title",children:t("APPS.SERVICES.JOB_MESSAGES")}),e("div",{className:"content",children:h.job&&h.job.map((l,m)=>s("div",{className:"item",onClick:()=>{E({...u,id:l.id,icon:"./assets/img/no-pfp.png",number:l.number}),o("chat")},children:[e("img",{src:"./assets/img/no-pfp.png"}),s("div",{className:"info",children:[s("div",{className:"info-header",children:[e("div",{className:"user",children:L(l.number)}),s("div",{className:"right",children:[e("div",{className:"time",children:_(l.timestamp)}),e(j,{})]})]}),e("div",{className:"message",children:N(l.lastMessage)?t("APPS.MESSAGES.SENT_LOCATION_SHORT"):l.lastMessage})]})]},m+100))})]})]})})}function de(){const{View:c}=S.useContext(V),a=g(k),[d,A]=c,[o,u]=S.useState([{icon:e(G,{}),title:t("APPS.SERVICES.COMPANIES"),value:"companies"},{icon:e(ne,{}),title:t("APPS.SERVICES.MESSAGES"),value:"messages"}]);return S.useEffect(()=>{var E,h;((h=(E=a==null?void 0:a.Companies)==null?void 0:E.Management)==null?void 0:h.Enabled)!==!1&&u([...o,{icon:e(ie,{}),title:t("APPS.SERVICES.ACTIONS"),value:"actions"}])},[]),e("div",{className:"companies-footer",children:o.map((E,h)=>s("div",{className:"item","data-active":d===E.value,onClick:()=>A(E.value),children:[E.icon,E.title]},h))})}const V=S.createContext(null);function Ee(){const[c,a]=S.useState("companies"),[d,A]=S.useState(null),o={companies:e(oe,{}),actions:e(se,{}),messages:e(re,{}),chat:e(ce,{})};let u={actions:t("APPS.SERVICES.ACTIONS"),messages:t("APPS.SERVICES.MESSAGES"),companies:t("APPS.SERVICES.COMPANIES")};return e(V.Provider,{value:{View:[c,a],Data:[d,A]},children:s("div",{className:"companies-container",children:[c!=="chat"&&e("div",{className:"companies-header",children:e("div",{className:"title",children:u[c]})}),e("div",{className:"companies-body",children:o[c]}),c!=="chat"&&e(de,{})]})})}export{V as ServicesContext,Ee as default};