import{r as N,a as i,j as e,F as g}from"./jsx-runtime-f40812bf.js";import{L as s,b as d,e as M,g as Z,J as B,C as O,h as U,K as z,M as j,N as q,c as V,f as I,k as H,n as J,l as Q,p as ee,i as se,I as ie}from"./Phone-1ddf01c8.js";import{u as v,c as _,M as ae,N as te,ar as ne,as as X,an as L,V as b,a8 as le,k as Y,S as ce,ab as K,at as re,F as oe,n as de,H as Se,a3 as Ne,au as Pe,av as me,X as he,aw as Te,ax as pe}from"./index.esm-e1f47206.js";import{r as w}from"./number-28525126.js";import{S as x}from"./Slider-cd59dfcd.js";import{N as W}from"./Numpad-cc7ba39c.js";function ue(n){const c=v(d.Settings),r=v(U),[t,P]=N.useState(!1),o=["#39334d","#465281","#87855e","#4b6a45","#702e2e","picker"];return i("div",{className:"animation-slide left",children:[i("div",{className:"top",children:[i("div",{className:"back",onClick:()=>t?P(!1):n.setPage([]),children:[e(_,{}),s("APPS.SETTINGS.TITLE")]}),e("div",{className:"title",children:s("APPS.SETTINGS.DISPLAY_BRIGHTNESS")}),e("div",{})]}),e("div",{style:{marginTop:"2rem"}}),e("div",{className:"category-title",children:s("APPS.SETTINGS.APPEARANCE")}),i("section",{children:[e("div",{className:"settings-item",children:e("div",{className:"appearance-container",children:e("div",{className:"appearance-switches",children:["light","dark"].map((l,h)=>i("div",{className:"mode",onClick:()=>{d.Settings.patch({display:{...c.display,theme:l}})},children:[e("img",{src:`./assets/img/${l}-mode-placeholder.png`,alt:"Theme"}),e("div",{className:"mode-text",children:M(l)}),e(Z,{checked:c.display.theme===l})]},h))})})}),i("div",{className:"settings-item",children:[e("div",{className:"setting",children:e("div",{className:"title",children:s("APPS.SETTINGS.AUTOMATIC")})}),e("div",{className:"setting-value",children:e(B,{checked:c.display.automatic,onChange:()=>{d.Settings.patch({display:{...c.display,automatic:!c.display.automatic}})}})})]})]}),e("div",{className:"category-title",children:s("APPS.SETTINGS.BRIGHTNESS")}),e("section",{children:i("div",{className:"settings-item",children:[e(ae,{}),e(x,{onChange:l=>{d.Settings.patch({display:{...c.display,brightness:l}})},value:c.display.brightness,id:"brightness",min:.1,max:1,step:.01}),e(te,{})]})}),e("div",{className:"category-title",children:s("APPS.SETTINGS.PHONE_SCALE")}),e("section",{children:i("div",{className:"settings-item",children:[e(ne,{}),e(x,{onChange:l=>{d.Settings.patch({display:{...c.display,size:l}})},value:c.display.size,id:"phone-scale-slider",min:.5,max:1.1,step:.1}),e(X,{})]})}),r.allowFrameColorChange&&i(g,{children:[e("div",{className:"category-title",children:s("APPS.SETTINGS.FRAME_COLOR")}),e("section",{children:e("div",{className:"settings-item",children:e("div",{className:"colors",children:o.map((l,h)=>{let m=l==="picker";return e("div",{className:"color",style:{backgroundImage:m&&"url(./assets/img/icons/picker.png)",boxShadow:!m&&`inset  0 0.1em 5em ${l}, 0 0 0 0.2em hsl(254, 30%, 85%)`},"data-active":c.display.frameColor===l,onClick:()=>{if(m){O.ColorPicker.set({onSelect:T=>{d.Settings.patch({display:{...c.display,frameColor:T}})}});return}d.Settings.patch({display:{...c.display,frameColor:l}})}},h)})})})})]})]})}function ve(n){var h,m,T,u;const c=v(U),r=v(d.Settings),[t,P]=N.useState(!1),[o,l]=N.useState(null);return i("div",{className:"animation-slide left",children:[i("div",{className:"top",children:[i("div",{className:"back",onClick:()=>{t?P(!1):n.setPage([])},children:[e(_,{}),t?s("APPS.SETTINGS.BACK"):s("APPS.SETTINGS.TITLE")]}),e("div",{className:"title",children:t?c.apps[o].name:s("APPS.SETTINGS.NOTIFICATIONS")}),e("div",{})]}),e("div",{style:{marginTop:"0.5rem"}}),t?e(g,{children:i("section",{children:[i("div",{className:"settings-item",children:[e("div",{className:"setting",children:e("div",{className:"title",children:s("APPS.SETTINGS.ALLOW_NOTIFICATIONS")})}),e("div",{className:"setting-value",children:e(B,{onChange:()=>{var S,p,f;d.Settings.patch({notifications:{...r.notifications,[o]:{...(S=r.notifications)==null?void 0:S[o],enabled:!((f=(p=r.notifications)==null?void 0:p[o])!=null&&f.enabled)}}})},checked:((m=(h=r.notifications)==null?void 0:h[o])==null?void 0:m.enabled)??!0})})]}),i("div",{className:"settings-item",children:[e("div",{className:"setting",children:e("div",{className:"title",children:s("APPS.SETTINGS.SOUNDS")})}),e("div",{className:"setting-value",children:e(B,{onChange:()=>{var S,p,f;d.Settings.patch({notifications:{...r.notifications,[o]:{...(S=r.notifications)==null?void 0:S[o],sound:!((f=(p=r.notifications)==null?void 0:p[o])!=null&&f.sound)}}})},checked:((u=(T=r.notifications)==null?void 0:T[o])==null?void 0:u.sound)??!0})})]})]})}):i(g,{children:[e("div",{className:"category-title",children:s("APPS.SETTINGS.NOTIFICATIONS")}),e("section",{style:{marginBottom:"4rem"},children:Object.keys(c.apps).filter(S=>{var p;return z(S)||((p=c.apps[S])==null?void 0:p.removable)===!1}).sort((S,p)=>c.apps[S].name.localeCompare(c.apps[p].name)).map((S,p)=>i("div",{className:"settings-item",style:{cursor:"pointer"},onClick:()=>{l(S),P(!0)},children:[i("div",{className:"setting",children:[e("img",{src:c.apps[S].icon??`./assets/img/icons/apps/${S}.png`}),e("div",{className:"title",children:c.apps[S].name})]}),e("div",{className:"setting-value",children:e(L,{className:"chevron"})})]},p))})]})]})}function Ee(n){var h;const c=v(d.Settings),[r,t]=N.useState(!1),[P,o]=N.useState(null),l=v(U);return i("div",{className:"animation-slide left",children:[i("div",{className:"top",children:[i("div",{className:"back",onClick:()=>{r?t(!1):n.setPage([]),d.SoundManager.reset()},children:[e(_,{}),r?s("APPS.SETTINGS.BACK"):s("APPS.SETTINGS.TITLE")]}),e("div",{className:"title",children:r?P==="ringtone"?s("APPS.SETTINGS.RINGTONE"):s("APPS.SETTINGS.TEXT_TONE"):s("APPS.SETTINGS.SOUND_HAPTICS")}),e("div",{})]}),e("div",{style:{marginTop:"0.5rem"}}),r?i(g,{children:[e("div",{className:"category-title",children:P==="ringtone"?s("APPS.SETTINGS.RINGTONE"):s("APPS.SETTINGS.TEXT_TONE")}),e("section",{children:Object.keys((h=l.sounds)==null?void 0:h[P]).map((m,T)=>e("div",{className:"settings-item",style:{cursor:"pointer"},onClick:()=>{var u,S;d.Settings.patch({sound:{...d.Settings.value.sound,[P]:m}}),d.SoundManager.set({url:`./assets/sound/ringtones/${(S=(u=l.sounds)==null?void 0:u[P])==null?void 0:S[m]}`,timeout:P==="ringtones"?5e3:null,override:!0})},children:i("div",{className:"setting",children:[m==c.sound[P]?e(b,{className:"checkmark"}):e(b,{className:"checkmark hidden"}),e("div",{className:"title",children:M(m)})]})},T))})]}):i(g,{children:[e("div",{className:"category-title",children:s("APPS.SETTINGS.RINGTONE_VOLUME")}),e("section",{children:i("div",{className:"settings-item",children:[e(le,{}),e(x,{onChange:m=>{d.Settings.patch({sound:{...d.Settings.value.sound,volume:m}})},value:c.sound.volume,min:0,max:1,step:.05}),e(Y,{})]})}),e("div",{className:"category-title",children:s("APPS.SETTINGS.SOUND_HAPTICS_PATTERNS")}),i("section",{children:[i("div",{className:"settings-item",style:{cursor:"pointer"},onClick:()=>{o("ringtone"),t(!0)},children:[e("div",{className:"setting",children:e("div",{className:"title",children:s("APPS.SETTINGS.RINGTONE")})}),i("div",{className:"setting-value",children:[e("div",{className:"value",children:M(c.sound.ringtone)}),e(L,{className:"chevron"})]})]}),i("div",{className:"settings-item",style:{cursor:"pointer"},children:[e("div",{className:"setting",children:e("div",{className:"title",children:s("APPS.SETTINGS.TEXT_TONE")})}),i("div",{className:"setting-value",children:[e("div",{className:"value",children:s("APPS.SETTINGS.DEFAULT")}),e(L,{className:"chevron"})]})]})]})]})]})}function ge(n){const{settingsSections:c}=N.useContext(D),r=v(d.Settings),t=v(U),P=8.25*1e3*1e3;return N.useEffect(()=>{if(!t.apps)return;let o=Object.keys(t.apps).filter(h=>{var m;return((m=t.apps[h])==null?void 0:m.removable)===!1}).reduce((h,m)=>h+t.apps[m].size,0),l=r.storage.used-(o+P);U.patch({apps:{...t.apps,Photos:{...t.apps.Photos,size:t.apps.Photos.size+l}}})},[]),i("div",{className:"animation-slide left",children:[i("div",{className:"top",children:[i("div",{className:"back",onClick:()=>{var o;n.setPage((o=c==null?void 0:c[2])==null?void 0:o[0].options)},children:[e(_,{}),s("APPS.SETTINGS.TITLE")]}),e("div",{className:"title",children:s("APPS.SETTINGS.STORAGE")}),e("div",{})]}),e("div",{style:{marginTop:"0.5rem"}}),e("section",{children:i("div",{className:"settings-item",style:{cursor:"pointer"},children:[e("div",{className:"setting",children:e("div",{className:"title",children:s("APPS.SETTINGS.USED")})}),e("div",{className:"setting-value",children:i("div",{className:"value",children:[w(r.storage.used/1e3/1e3,2)," GB ",s("APPS.SETTINGS.OF")," ",w(r.storage.total/1e3/1e3,0)," GB"]})})]})}),e("section",{children:Object.keys(t.apps).filter(o=>{var l;return z(o)||((l=t.apps[o])==null?void 0:l.removable)===!1}).sort((o,l)=>t.apps[l].size-t.apps[o].size).map((o,l)=>i("div",{className:"settings-item",style:{cursor:"pointer"},children:[i("div",{className:"setting",children:[e("img",{src:t.apps[o].icon??`./assets/img/icons/apps/${o}.png`}),e("div",{className:"title",children:t.apps[o].name})]}),e("div",{className:"setting-value",children:e("div",{className:"value",children:t.apps[o].size>1e6?w(t.apps[o].size/1e6,2)+" GB":t.apps[o].size>1e3?w(t.apps[o].size/1e3,2)+" MB":t.apps[o].size+" KB"})})]}))})]})}function Ae(n){const c=v(d.Settings),[r,t]=N.useState(!1),P=v(U);return i("div",{className:"animation-slide right",children:[i("div",{className:"top",children:[i("div",{className:"back",onClick:()=>{r?t(!1):n.setPage([])},children:[e(_,{}),r?s("APPS.SETTINGS.WALLPAPER"):s("APPS.SETTINGS.TITLE")]}),i("div",{className:"title",children:[r?s("APPS.SETTINGS.WALLPAPERS"):s("APPS.SETTINGS.WALLPAPER")," "]}),e("div",{})]}),r?i("div",{className:"wallpapers-container",children:[e("div",{className:"wallpaper add",onClick:()=>{var o,l,h;O.Gallery.set({allowExternal:(h=(l=(o=U)==null?void 0:o.value)==null?void 0:l.AllowExternal)==null?void 0:h.Other,onSelect:m=>{d.Settings.patch({wallpaper:{...c.wallpaper,background:m.src}})}})},children:e(X,{})}),c.wallpaper.background.includes("http")&&e("div",{className:"wallpaper active",style:{backgroundImage:`url(${c.wallpaper.background})`}}),P.wallpapers.map((o,l)=>e(Ie,{wallpaper:o,selected:c.wallpaper.background,theme:c.display.theme,cb:()=>{d.Settings.patch({wallpaper:{...c.wallpaper,background:o}})}},l))]}):e(Ce,{setExploringWallpapers:t})]})}const Ie=({wallpaper:n,theme:c,selected:r,cb:t})=>{const[P,o]=N.useState("");return N.useEffect(()=>{j(n,l=>o(l))},[]),e("div",{className:`wallpaper ${r===n?"active":""}`,style:{backgroundImage:`url(${P})`},onClick:()=>t()})},Ce=n=>{var P,o,l;const[c,r]=N.useState(""),t=v(d.Settings);return N.useEffect(()=>{j(t.wallpaper.background,h=>r(h))},[]),i("section",{children:[i("div",{className:"settings-item",style:{cursor:"pointer"},onClick:()=>n.setExploringWallpapers(!0),children:[e("div",{className:"setting",children:e("div",{className:"title",children:s("APPS.SETTINGS.CHOOSE_NEW_WALLPAPER")})}),e("div",{className:"setting-value",children:e(L,{className:"chevron"})})]}),e("div",{className:"settings-item",children:i("div",{className:"wallpapers",children:[e("div",{className:"preview",style:{backgroundImage:`url(${c})`},children:i("div",{className:"lockscreen-container",children:[e(ce,{}),e("div",{className:"date",style:{color:((P=t==null?void 0:t.lockscreen)==null?void 0:P.color)??"#ffffff"},children:"Friday, September 16"}),e("div",{className:"time","data-style":((o=t==null?void 0:t.lockscreen)==null?void 0:o.fontStyle)??"1",style:{color:((l=t==null?void 0:t.lockscreen)==null?void 0:l.color)??"#ffffff"},children:"13:37"})]})}),e("div",{className:"preview",style:{backgroundImage:`url(${c})`},children:i("div",{className:"settings-homescreen-container",children:[e("div",{className:"settings-homescreen-apps",children:t.apps[1].filter(h=>!q(h)).slice(0,24).map(h=>{var u;let m=U.value.apps[h],T=((u=m==null?void 0:m[h])==null?void 0:u.icon)??`./assets/img/icons/apps/${h}.png`;return i("div",{className:"settings-homescreen-app",children:[e("img",{src:T,onError:S=>S.currentTarget.src="./assets/img/icons/apps/unkown.png"}),e("div",{className:"app-name",children:h})]})})}),e("div",{className:"favourite-apps",children:t.apps[0].map(h=>e("div",{className:"settings-homescreen-app",children:e("img",{src:`./assets/img/icons/apps/${h}.png`})}))})]})})]})})]})};function fe(n){const c=N.useRef(null),r=v(d.Settings),[t,P]=N.useState([]),[o,l]=N.useState(!1),[h,m]=N.useState([]),[T,u]=N.useState(!1),S=A=>{if(A=="backspace")P(E=>E.slice(0,-1));else{const E=[...t,A];P([...t,A]),E.length>3&&(T?I("Security",{action:"setPin",pin:E.join("")}).then(R=>{d.Settings.patch({security:{...r.security,pinCode:!0}}),u(!1),P([])}):I("Security",{action:"verifyPin",pin:E.join("")}).then(R=>{R?(l(!0),m(E),P([])):(c.current.className=`pin-circles wrong ${r.display.theme=="dark"?"light":"dark"}`,setTimeout(()=>{c.current.className=`pin-circles ${r.display.theme=="dark"?"light":"dark"}`,P([])},350))}))}},p=A=>{A?I("Security",{action:"setFaceId",pin:h.join("")}).then(E=>{E&&d.Settings.patch({security:{...d.Settings.value.security,faceId:!0}})}):I("Security",{action:"removeFaceId",pin:h.join("")}).then(E=>{E&&d.Settings.patch({security:{...d.Settings.value.security,faceId:!1}})})},f=()=>{I("Security",{action:"removePin",pin:t.join("")}).then(A=>{A&&d.Settings.patch({security:{pinCode:!1,faceId:!1}})})};return i("div",{className:"animation-slide left",children:[i("div",{className:"top",children:[i("div",{className:"back",onClick:()=>{n.setPage([])},children:[e("i",{className:"fal fa-chevron-left"}),o||!r.security.pinCode?s("APPS.SETTINGS.BACK"):s("CANCEL")]}),e("div",{className:"title",children:o||!r.security.pinCode?s("APPS.SETTINGS.FACE_ID_PASSWORD"):s("APPS.SETTINGS.ENTER_PASSCODE")}),e("div",{})]}),o||!r.security.pinCode?e(g,{children:T?i("div",{className:"passcode-container",children:[i("div",{className:"pin",children:[s("APPS.SETTINGS.ENTER_PASSCODE"),e(V,{pin:t,dark:r.display.theme,Ref:c})]}),e("div",{className:"numbers",children:e(W,{cb:A=>{S(A)}})})]}):i(g,{children:[e("div",{style:{marginTop:"0.5rem"}}),e("div",{className:"category-title",children:s("APPS.SETTINGS.FACE_ID")}),e("section",{children:r.security.faceId?e("div",{className:"settings-item",style:{cursor:"pointer"},onClick:()=>{O.PopUp.set({title:s("APPS.SETTINGS.DISABLE_FACE_ID_POPUP.TITLE"),description:s("APPS.SETTINGS.DISABLE_FACE_ID_POPUP.TEXT"),buttons:[{title:s("APPS.SETTINGS.DISABLE_FACE_ID_POPUP.CANCEL")},{title:s("APPS.SETTINGS.DISABLE_FACE_ID_POPUP.CONFIRM"),color:"red",cb:()=>{p(!1)}}]})},children:e("div",{className:"setting",children:e("div",{className:"title red",children:s("APPS.SETTINGS.RESET_FACE_ID")})})}):e("div",{className:"settings-item",style:{cursor:"pointer"},onClick:()=>{r.security.pinCode&&O.PopUp.set({title:s("APPS.SETTINGS.ENABLE_FACE_ID_POPUP.TITLE"),description:s("APPS.SETTINGS.ENABLE_FACE_ID_POPUP.TEXT"),buttons:[{title:s("APPS.SETTINGS.ENABLE_FACE_ID_POPUP.CANCEL")},{title:s("APPS.SETTINGS.ENABLE_FACE_ID_POPUP.CONFIRM"),cb:()=>{p(!0)}}]})},children:e("div",{className:"setting",children:e("div",{className:`title ${r.security.pinCode?"blue":"grey"}`,children:s("APPS.SETTINGS.ENABLE_FACE_ID")})})})}),e("div",{className:"category-title",children:s("APPS.SETTINGS.PIN_CODE")}),e("section",{children:r.security.pinCode?i(g,{children:[e("div",{className:"settings-item",style:{cursor:"pointer"},onClick:()=>{O.PopUp.set({title:s("APPS.SETTINGS.DISABLE_PIN_POPUP.TITLE"),description:s("APPS.SETTINGS.DISABLE_PIN_POPUP.TEXT"),buttons:[{title:s("APPS.SETTINGS.DISABLE_PIN_POPUP.CANCEL")},{title:s("APPS.SETTINGS.DISABLE_PIN_POPUP.CONFIRM"),color:"red",cb:()=>f()}]})},children:e("div",{className:"setting",children:e("div",{className:"title blue",children:s("APPS.SETTINGS.TURN_PASSCODE_OFF")})})}),e("div",{className:"settings-item",style:{cursor:"pointer"},onClick:()=>u(!0),children:e("div",{className:"setting",children:e("div",{className:"title blue",children:s("APPS.SETTINGS.CHANGE_PASSCODE")})})})]}):i(g,{children:[e("div",{className:"settings-item",style:{cursor:"pointer"},onClick:()=>{u(!0)},children:e("div",{className:"setting",children:e("div",{className:"title blue",children:s("APPS.SETTINGS.TURN_PASSCODE_ON")})})}),e("div",{className:"settings-item",children:e("div",{className:"setting",children:e("div",{className:"title grey",children:s("APPS.SETTINGS.CHANGE_PASSCODE")})})})]})})]})}):i("div",{className:"passcode-container",children:[i("div",{className:"pin",children:[s("APPS.SETTINGS.ENTER_PASSCODE"),e(V,{pin:t,dark:r.display.theme,Ref:c})]}),e("div",{className:"numbers",children:e(W,{cb:A=>S(A)})})]})]})}function Ge(n){var u;const c=v(d.Settings),r=v(d.PhoneNumber),[t,P]=N.useState(!1),[o,l]=N.useState(!1),[h,m]=N.useState([]);N.useEffect(()=>{I("Phone",{action:"getBlockedNumbers"}).then(S=>{S&&m(S)})},[]);const T=S=>{I("Phone",{action:"toggleBlock",number:S,blocked:!1}).then(p=>{p&&m(f=>f.filter(A=>A!==S))})};return i("div",{className:`animation-slide ${t?"left":"right"}`,children:[i("div",{className:"top",children:[i("div",{className:"back",onClick:()=>t?P(!1):n.setPage([]),children:[e(_,{}),t?s("APPS.SETTINGS.BACK"):s("APPS.SETTINGS.TITLE")]}),e("div",{className:"title",children:t?s("APPS.SETTINGS.BLOCKED_CONTACTS"):s("APPS.SETTINGS.PHONE")}),t?e("div",{className:"value",onClick:()=>l(S=>!S),children:o?s("APPS.SETTINGS.DONE"):s("APPS.SETTINGS.EDIT")}):e("div",{})]}),e("div",{style:{marginTop:"0.5rem"}}),t?e(g,{children:e("section",{children:h.map((S,p)=>i("div",{className:"settings-item",children:[i("div",{className:"setting",children:[o?e(K,{className:"remove",onClick:()=>{O.PopUp.set({title:s("APPS.SETTINGS.UNBLOCK_POPUP.TITLE"),description:s("APPS.SETTINGS.UNBLOCK_POPUP.TEXT"),buttons:[{title:s("APPS.SETTINGS.UNBLOCK_POPUP.CANCEL")},{title:s("APPS.SETTINGS.UNBLOCK_POPUP.CONFIRM"),color:"red",cb:()=>{T(S)}}]})}}):e(K,{className:"hidden"}),e("div",{className:"title",children:H(S)})]}),e("div",{className:"setting-value"})]},p))})}):i(g,{children:[e("section",{children:i("div",{className:"settings-item",children:[e("div",{className:"setting",children:e("div",{className:"title",children:s("APPS.SETTINGS.MY_NUMBER")})}),i("div",{className:"setting-value",children:[H(r),e(re,{onClick:()=>{J(r)}})]})]})}),i("section",{children:[i("div",{className:"settings-item",children:[e("div",{className:"setting",children:e("div",{className:"title",children:s("APPS.SETTINGS.SHOW_CALLER_ID")})}),e("div",{className:"setting-value",children:e(B,{onChange:()=>{var S;d.Settings.patch({phone:{...c.phone,showCallerId:!((S=c.phone)!=null&&S.showCallerId)}})},checked:((u=c.phone)==null?void 0:u.showCallerId)??!1})})]}),i("div",{className:"settings-item",style:{cursor:"pointer"},onClick:()=>P(!0),children:[e("div",{className:"setting",children:e("div",{className:"title",children:s("APPS.SETTINGS.BLOCKED_CONTACTS")})}),e("div",{className:"setting-value",children:e(L,{className:"chevron"})})]})]})]})]})}function ke({setPage:n}){const c=v(d.PhoneNumber),[r,t]=N.useState([]),[P,o]=N.useState(!1);return N.useEffect(()=>{I("Backup",{action:"get"}).then(l=>{l&&t(l)})},[]),i("div",{className:"animation-slide left",children:[i("div",{className:"top",children:[i("div",{className:"back",onClick:()=>n([]),children:[e(_,{}),s("APPS.SETTINGS.TITLE")]}),e("div",{className:"title",children:s("APPS.SETTINGS.CLOUD_BACKUP")}),e("div",{className:"value",onClick:()=>o(l=>!l),children:P?s("APPS.SETTINGS.DONE"):s("APPS.SETTINGS.EDIT")})]}),e("div",{style:{marginTop:"0.5rem"}}),e("div",{className:"category-title",children:s("APPS.SETTINGS.YOUR_PROFILE")}),e("section",{children:i("div",{className:"settings-item",style:{cursor:"pointer"},onClick:()=>{r.find(l=>l.number===c)||O.PopUp.set({title:s("APPS.SETTINGS.SAVE_BACKUP_POPUP.TITLE"),description:s("APPS.SETTINGS.SAVE_BACKUP_POPUP.TEXT"),buttons:[{title:s("APPS.SETTINGS.SAVE_BACKUP_POPUP.CANCEL")},{title:s("APPS.SETTINGS.SAVE_BACKUP_POPUP.CONFIRM"),cb:()=>{I("Backup",{action:"create"}).then(l=>{l&&t([{number:c}])})}}]})},children:[e("div",{className:"setting",children:e("div",{className:"title",children:s("APPS.SETTINGS.CREATE_BACKUP")})}),e("div",{className:"setting-value"})]})}),e("div",{className:"category-title",children:s("APPS.SETTINGS.BACKUPS")}),e("section",{children:r.map((l,h)=>i("div",{className:"settings-item",style:{cursor:"pointer"},onClick:()=>{O.PopUp.set({title:s("APPS.SETTINGS.APPLY_BACKUP_POPUP.TITLE"),description:s("APPS.SETTINGS.APPLY_BACKUP_POPUP.TEXT"),buttons:[{title:s("APPS.SETTINGS.APPLY_BACKUP_POPUP.CANCEL")},{title:s("APPS.SETTINGS.APPLY_BACKUP_POPUP.CONFIRM"),color:"red",cb:()=>{I("Backup",{action:"apply",number:l.number}).then(m=>{m&&setTimeout(()=>{O.PopUp.set({title:s("APPS.SETTINGS.SUCCESS"),description:s("APPS.SETTINGS.SUCCESS_TEXT"),buttons:[{title:s("APPS.SETTINGS.OK")}]})},500)})}}]})},children:[i("div",{className:"setting",children:[P&&e(K,{className:"remove",onClick:m=>{m.stopPropagation(),O.PopUp.set({title:s("APPS.SETTINGS.REMOVE_BACKUP_POPUP.TITLE"),description:s("APPS.SETTINGS.REMOVE_BACKUP_POPUP.TEXT"),buttons:[{title:s("APPS.SETTINGS.REMOVE_BACKUP_POPUP.CANCEL")},{title:s("APPS.SETTINGS.REMOVE_BACKUP_POPUP.CONFIRM"),color:"red",cb:()=>{I("Backup",{action:"delete",number:l.number}).then(T=>{T&&t(u=>u.filter(S=>S.number!==l.number))})}}]})}}),e("div",{className:"title",children:H(l.number)})]}),e("div",{className:"setting-value"})]},h))})]})}function $({setPage:n,type:c}){const{settingsSections:r}=N.useContext(D);return i("div",{className:"animation-slide left",children:[i("div",{className:"top",children:[i("div",{className:"back",onClick:()=>{var t;return n((t=r==null?void 0:r[2])==null?void 0:t[0].options)},children:[e(_,{}),s("APPS.SETTINGS.TITLE")]}),e("div",{className:"title",children:s(`APPS.SETTINGS.${c.toUpperCase()}`)}),e("div",{})]}),e("div",{style:{marginTop:"0.5rem"}}),i("section",{children:[c==="Language"&&e(Oe,{}),c==="Temperature"&&e(_e,{})]})]})}const Oe=()=>{const n=v(d.Settings),[c,r]=N.useState([]);return N.useEffect(()=>{I("getLocales").then(t=>{t&&r(t)})},[]),N.useEffect(()=>{Q(n.locale)},[n.locale]),i(g,{children:[c.map((t,P)=>e("div",{className:"settings-item",style:{cursor:"pointer"},onClick:()=>d.Settings.patch({locale:t.locale}),children:i("div",{className:"setting",children:[t.locale===n.locale?e(b,{className:"checkmark"}):e(b,{className:"checkmark hidden"}),e("div",{className:"title",children:t.name})]})},P)),";"]})},_e=()=>{const n=v(d.Settings);return i(g,{children:[e("div",{className:"settings-item",style:{cursor:"pointer"},onClick:()=>d.Settings.patch({weather:{celcius:!0}}),children:i("div",{className:"setting",children:[n.weather&&n.weather.celcius?e(b,{className:"checkmark"}):e(b,{className:"checkmark hidden"}),e("div",{className:"title",children:s("APPS.SETTINGS.CELCIUS")})]})}),e("div",{className:"settings-item",style:{cursor:"pointer"},onClick:()=>d.Settings.patch({weather:{celcius:!1}}),children:i("div",{className:"setting",children:[n.weather&&n.weather.celcius===!1?e(b,{className:"checkmark"}):e(b,{className:"checkmark hidden"}),e("div",{className:"title",children:s("APPS.SETTINGS.FAHRENHEIT")})]})})]})};function ye(n){const{settingsSections:c}=N.useContext(D),r=v(d.Settings);return i("div",{className:"animation-slide left",children:[i("div",{className:"top",children:[i("div",{className:"back",onClick:()=>{var t;return n.setPage((t=c==null?void 0:c[2])==null?void 0:t[0].options)},children:[e(_,{}),s("APPS.SETTINGS.TITLE")]}),e("div",{className:"title",children:s("APPS.SETTINGS.SOFTWARE_UPDATE")}),e("div",{})]}),e("div",{style:{marginTop:"0.5rem"}}),e("section",{children:i("div",{className:"settings-item",style:{cursor:"pointer"},children:[e("div",{className:"setting",children:e("div",{className:"title",children:s("APPS.SETTINGS.AUTOMATIC_UPDATES")})}),e("div",{className:"setting-value",children:e("div",{className:"value",children:s("APPS.SETTINGS.OFF")})})]})}),r.version!==r.latestVersion&&e("section",{children:i("div",{className:"settings-item",style:{flexDirection:"column",alignItems:"inherit",gap:"0.75rem"},children:[i("div",{className:"item-header",children:[e("img",{src:"https://cdn.discordapp.com/attachments/1032954560844660756/1032954807926931496/unknown.png"}),i("div",{className:"info",children:[i("div",{className:"title",children:["V",r.latestVersion]}),e("div",{className:"author",children:e(Le,{})})]})]}),e("div",{className:"item-content",children:"Please tell your server owner to update the phone to the latest version."})]})}),r.version===r.latestVersion&&i("div",{className:"up-to-date",children:[i("div",{className:"version",children:["V ",r==null?void 0:r.version]}),e("div",{className:"title",children:s("APPS.SETTINGS.UP_TO_DATE")})]})]})}const Le=()=>{const n="abcdefghijklmnopqrstuvwxyz".split("");return i(g,{children:[n[11].toUpperCase(),n[1].toUpperCase()]})};const D=N.createContext(null);function Fe(){var R;const n=v(d.Settings),[c,r]=N.useState(""),[t,P]=N.useState([]),[o,l]=N.useState([]),[h,m]=N.useState(null),[T,u]=N.useState(null),[S,p]=N.useState([]);N.useEffect(()=>{p(C=>{let G=0;return[[{name:s("APPS.SETTINGS.AIRPLANE_MODE"),icon:e(oe,{className:"orange"}),switch:!0,value:n.airplaneMode,onChange:()=>{d.Settings.patch({airplaneMode:!n.airplaneMode})}},{name:s("APPS.SETTINGS.STREAMER_MODE"),icon:e(de,{className:"purple"}),switch:!0,value:n.streamerMode,onChange:()=>{d.Settings.patch({streamerMode:!n.streamerMode})}},{name:s("APPS.SETTINGS.BLUETOOTH"),icon:e(Se,{className:"blue"}),value:s("APPS.SETTINGS.ON")}],[{name:s("APPS.SETTINGS.NOTIFICATIONS"),icon:e(Ne,{className:"red"}),options:e(ve,{setPage:l})},{name:s("APPS.SETTINGS.SOUND_HAPTICS"),icon:e(Y,{className:"pink"}),options:e(Ee,{setPage:l})}],[{name:s("APPS.SETTINGS.GENERAL"),icon:e(Pe,{className:"grey"}),notification:n.version!==n.latestVersion,options:[[{name:s("APPS.SETTINGS.ABOUT"),options:[[{name:s("APPS.SETTINGS.NAME"),value:n.name,input:{type:"name",maxLength:20},cb:(a,y)=>{I("setPhoneName",a)}},{name:s("APPS.SETTINGS.VERSION"),value:n.version},{name:s("APPS.SETTINGS.MODEL_NAME"),value:"LB Phone"},{name:s("APPS.SETTINGS.SERIAL_NUMBER"),value:"DSDWWWSSF3"},{name:s("APPS.SETTINGS.DEVELOPED_BY"),value:"Breze & Loaf Scripts"},{name:s("APPS.SETTINGS.PURCHASE_AT"),value:"https://lbphone.com",isLink:!0}],[{name:s("APPS.SETTINGS.SONGS"),value:"0"},{name:s("APPS.SETTINGS.VIDEOS"),value:"0"},{name:s("APPS.SETTINGS.PHOTOS"),value:G??0},{name:s("APPS.SETTINGS.APPLICATIONS"),value:f()},{name:s("APPS.SETTINGS.CAPACITY"),value:`${n.storage.total/1e3/1e3} GB`},{name:s("APPS.SETTINGS.AVAILABLE"),value:`${w((n.storage.total-n.storage.used)/1e3/1e3,1)} GB`}]]},{name:s("APPS.SETTINGS.SOFTWARE_UPDATE"),options:e(ye,{setPage:l}),notification:n.version!==n.latestVersion},{name:s("APPS.SETTINGS.PHONE_STORAGE"),options:e(ge,{setPage:l})}],[{name:s("APPS.SETTINGS.DATE_TIME"),options:[[{name:s("APPS.SETTINGS.24_HOUR_TIME"),switch:!0,value:!n.time.twelveHourClock,id:"twelveHourClock",onChange:()=>{d.Settings.patch({time:{...n.time,twelveHourClock:!n.time.twelveHourClock}})}}],[{name:s("APPS.SETTINGS.SET_AUTOMATICALLY"),switch:!0,value:!0,disabled:!0},{name:s("APPS.SETTINGS.TIME_ZONE"),value:Intl.DateTimeFormat().resolvedOptions().timeZone??"Unknown"}]]},{name:s("APPS.SETTINGS.LANGUAGE_REGION"),options:[[{name:s("APPS.SETTINGS.LANGUAGE"),value:s("LABEL"),options:e($,{type:"Language",setPage:l})}],[{name:s("APPS.SETTINGS.TEMPERATURE"),value:n.weather&&n.weather.celcius?"C":"F",options:e($,{type:"Temperature",setPage:l})}]]}],[{name:s("APPS.SETTINGS.RESET_POPUP.TITLE"),onClick:()=>{O.PopUp.set({title:s("APPS.SETTINGS.RESET_POPUP.TITLE"),description:s("APPS.SETTINGS.RESET_POPUP.TEXT"),buttons:[{title:s("APPS.SETTINGS.RESET_POPUP.CANCEL")},{title:s("APPS.SETTINGS.RESET_POPUP.CONFIRM"),color:"red",cb:()=>{I("Security",{action:"factoryReset"})}}]})}}]]},{name:s("APPS.SETTINGS.DISPLAY_BRIGHTNESS"),icon:e(me,{className:"blue"}),options:e(ue,{setPage:l})},{name:s("APPS.SETTINGS.WALLPAPER"),icon:e(he,{className:"lightblue"}),options:e(Ae,{setPage:l})},{name:s("APPS.SETTINGS.FACE_ID_PASSWORD"),icon:e(Te,{className:"green"}),options:e(fe,{setPage:l})},{name:s("APPS.SETTINGS.BATTERY"),icon:e(pe,{className:"green"})}],[{name:s("APPS.SETTINGS.PHONE"),icon:"./assets/img/icons/apps/Phone.png",color:"green",options:e(Ge,{setPage:l}),last:!0}]]})},[n]);const f=()=>{let C=0;return n.apps.forEach(G=>{G.forEach(a=>{C++})}),C},A=N.useRef(!0),E=N.useRef(!1);return N.useEffect(()=>{if(A.current){A.current=!1;return}E!=null&&E.current||(E.current=!0)},[n]),N.useEffect(()=>()=>{E!=null&&E.current&&I("setSettings",n)},[]),N.useEffect(()=>{if(c.length>0){let C=S.map(G=>G.filter(a=>{var y;return a.name.toLowerCase().includes(c.toLowerCase())?!0:a.options&&((y=a.options)!=null&&y.name)?a.options.filter(k=>{if(k.name.toLowerCase().includes(c.toLowerCase()))return!0;if(k.options)return k.options.filter(F=>{if(F.name.toLowerCase().includes(c.toLowerCase()))return!0})}):!1}));P(C)}else P([])},[c]),e(D.Provider,{value:{settingsSections:S},children:e("div",{className:"settings-container",children:o.length===0?i("div",{className:"animation-slide right",children:[e("div",{className:"title",style:((R=n==null?void 0:n.display)==null?void 0:R.theme)==="dark"?{color:"#ffffff"}:{color:"#000000"},children:s("APPS.SETTINGS.TITLE")}),e(ee,{placeholder:s("SEARCH"),onChange:C=>r(C.target.value)}),t.length>0?e("section",{children:t.map((C,G)=>C.map((a,y)=>i("div",{className:"settings-item","data-clickable":!!(a.options||a.onClick),onClick:()=>{if(a.onClick)return a.onClick();a.options&&(l(a.options),m(a.name))},children:[i("div",{className:"setting",children:[a.icon&&(typeof a.icon=="string"?e("img",{src:a.icon}):a.icon),e("div",{className:"title",children:a.name})]}),i("div",{className:"setting-value",children:[a.switch&&e(B,{onChange:a.onChange,checked:a.value,disabled:a.disabled??!1}),a.value&&!a.switch&&e("div",{className:"value",children:a.value}),a.options&&e(L,{className:"chevron"})]})]},y)))}):i(g,{children:[i("div",{className:"profile",onClick:()=>l(e(ke,{setPage:l})),children:[n!=null&&n.avatar?e("img",{src:n.avatar}):e("div",{className:"profile-image",children:se(n.name)}),i("div",{className:"profile-info",children:[e("div",{className:"name",children:n.name}),e("div",{className:"info",children:s("APPS.SETTINGS.CLOUD_BACKUP")})]}),e(L,{className:"chevron"})]}),S.map((C,G)=>e("section",{"data-last":G===S.length-1,children:C.map((a,y)=>i("div",{className:"settings-item","data-clickable":!!(a.options||a.onClick),onClick:()=>{if(a.onClick)return a.onClick();a.options&&(l(a.options),m(a.name))},children:[i("div",{className:"setting",children:[a.icon&&(typeof a.icon=="string"?e("img",{src:a.icon}):a.icon),e("div",{className:"title",children:a.name})]}),a.notification&&e("div",{className:"settings-notification",children:"1"}),i("div",{className:"setting-value",children:[a.switch&&e(B,{onChange:a.onChange,checked:a.value,disabled:a.disabled??!1}),a.value&&!a.switch&&e("div",{className:"value",children:a.value}),a.options&&e(L,{className:"chevron"})]})]},y))},G))]})]}):e(g,{children:o.length?i("div",{className:"animation-slide left",children:[i("div",{className:"top",children:[i("div",{className:"back",onClick:()=>{l((T==null?void 0:T.page)??[]),m((T==null?void 0:T.name)??"Settings"),u(null)},children:[e(_,{}),s("APPS.SETTINGS.TITLE")]}),i("div",{className:"title",children:[h??"Settings"," "]}),e("div",{})]}),o.map((C,G)=>e("section",{children:C.map((a,y)=>i("div",{className:"settings-item","data-clickable":!!(a.options||a.onClick),onClick:()=>{var k;if(a.onClick)return a.onClick();a.options&&(l(a.options),m(a.name),(k=a.options)!=null&&k[0]&&u(o))},children:[e("div",{className:"setting",children:e("div",{className:"title",children:a.name})}),a.notification&&e("div",{className:"settings-notification",children:"1"}),e("div",{className:"setting-value",children:a.input?e(ie,{defaultValue:a.value,maxLength:a.input.maxLength,onChange:k=>{let F={...n,[a.input.type]:k.target.value};d.Settings.set(F)},onBlur:()=>{a.cb&&a.cb(n[a.input.type],n)}}):i(g,{children:[a.switch&&e(B,{onChange:()=>{var k;a.id?a.id=="twelveHourClock"&&d.Settings.patch({time:{...n==null?void 0:n.time,twelveHourClock:!((k=n==null?void 0:n.time)!=null&&k.twelveHourClock)}}):a.onChange()},checked:a.value,disabled:a.disabled??!1}),a.value&&e("div",{className:"value",children:a.isLink?e("a",{onClick:()=>window.invokeNative("openUrl",a.value),children:a.value}):a.value}),a.options&&e(L,{className:"chevron"})]})})]},y))},G))]}):o})})})}export{D as AppContext,Fe as default};