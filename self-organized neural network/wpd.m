function [subs_x,subs_y,subs_z]=wpd(VX,VY,VZ,level)
    wpt_vx = wpdec(VX,level,'db10','shannon');
    wpt_vy = wpdec(VY,level,'db10','shannon');
    wpt_vz = wpdec(VZ,level,'db10','shannon');

    % read the node information of vx and reconstruct wave x
    if level==2
        subs_x=cell(1,4);
        subs_y=cell(1,4);
        subs_z=cell(1,4);
%         nodeSize = read(wpt_vx,'sizes',[4,5,6]);
        cfs3=wpcoef(wpt_vx,3);
        cfs4=wpcoef(wpt_vx,4);
        cfs5=wpcoef(wpt_vx,5);
        cfs6=wpcoef(wpt_vx,6);
        subs_x(1)={cfs3};
        subs_x(2)={cfs4};
        subs_x(3)={cfs5};
        subs_x(4)={cfs6};
%         temptree = write(wpt_vx,'cfs',3,cfs3,'cfs',4,cfs4,'cfs',5,cfs5,'cfs',6,cfs6);
%         wavex=wprec(temptree);
        % read the node information of vy and reconstruct wave y
%         nodeSize = read(wpt_vy,'sizes',[4,5,6]);
        cfs3=wpcoef(wpt_vy,3);
        cfs4=wpcoef(wpt_vy,4);
        cfs5=wpcoef(wpt_vy,5);
        cfs6=wpcoef(wpt_vy,6);
        subs_y(1)={cfs3};
        subs_y(2)={cfs4};
        subs_y(3)={cfs5};
        subs_y(4)={cfs6};
%         temptree = write(wpt_vy,'cfs',3,cfs3,'cfs',4,cfs4,'cfs',5,cfs5,'cfs',6,cfs6);
%         wavey=wprec(temptree);
        % read the node information of vz and reconstruct wave z
%         nodeSize = read(wpt_vz,'sizes',[4,5,6]);
        cfs3=wpcoef(wpt_vz,3);
        cfs4=wpcoef(wpt_vz,4);
        cfs5=wpcoef(wpt_vz,5);
        cfs6=wpcoef(wpt_vz,6);
        subs_z(1)={cfs3};
        subs_z(2)={cfs4};
        subs_z(3)={cfs5};
        subs_z(4)={cfs6};
%         temptree = write(wpt_vz,'cfs',3,cfs3,'cfs',4,cfs4,'cfs',5,cfs5,'cfs',6,cfs6);
%         wavez=wprec(temptree);
    elseif level==3
        subs_x=cell(1,8);
        subs_y=cell(1,8);
        subs_z=cell(1,8);
%         nodeSize = read(wpt_vx,'sizes',[7,8,9,10,11,12,13,14]);
        cfs7=wpcoef(wpt_vx,7);
        cfs8=wpcoef(wpt_vx,8);
        cfs9=wpcoef(wpt_vx,9);
        cfs10=wpcoef(wpt_vx,10);
        cfs11=wpcoef(wpt_vx,11);
        cfs12=wpcoef(wpt_vx,12);
        cfs13=wpcoef(wpt_vx,13);
        cfs14=wpcoef(wpt_vx,14);
        subs_x(1)={cfs7};
        subs_x(2)={cfs8};
        subs_x(3)={cfs9};
        subs_x(4)={cfs10};
        subs_x(5)={cfs11};
        subs_x(6)={cfs12};
        subs_x(7)={cfs13};
        subs_x(8)={cfs14};
%         temptree = write(wpt_vx,'cfs',3,cfs3,'cfs',4,cfs4,'cfs',5,cfs5,'cfs',6,cfs6);
%         wavex=wprec(temptree);
        % read the node information of vy and reconstruct wave y
%         nodeSize = read(wpt_vy,'sizes',[7,8,9,10,11,12,13,14]);
        cfs7=wpcoef(wpt_vy,7);
        cfs8=wpcoef(wpt_vy,8);
        cfs9=wpcoef(wpt_vy,9);
        cfs10=wpcoef(wpt_vy,10);
        cfs11=wpcoef(wpt_vy,11);
        cfs12=wpcoef(wpt_vy,12);
        cfs13=wpcoef(wpt_vy,13);
        cfs14=wpcoef(wpt_vy,14);
        subs_y(1)={cfs7};
        subs_y(2)={cfs8};
        subs_y(3)={cfs9};
        subs_y(4)={cfs10};
        subs_y(5)={cfs11};
        subs_y(6)={cfs12};
        subs_y(7)={cfs13};
        subs_y(8)={cfs14};
%         temptree = write(wpt_vy,'cfs',3,cfs3,'cfs',4,cfs4,'cfs',5,cfs5,'cfs',6,cfs6);
%         wavey=wprec(temptree);
        % read the node information of vz and reconstruct wave z
%         nodeSize = read(wpt_vz,'sizes',[7,8,9,10,11,12,13,14]);
        cfs7=wpcoef(wpt_vz,7);
        cfs8=wpcoef(wpt_vz,8);
        cfs9=wpcoef(wpt_vz,9);
        cfs10=wpcoef(wpt_vz,10);
        cfs11=wpcoef(wpt_vz,11);
        cfs12=wpcoef(wpt_vz,12);
        cfs13=wpcoef(wpt_vz,13);
        cfs14=wpcoef(wpt_vz,14);
        subs_z(1)={cfs7};
        subs_z(2)={cfs8};
        subs_z(3)={cfs9};
        subs_z(4)={cfs10};
        subs_z(5)={cfs11};
        subs_z(6)={cfs12};
        subs_z(7)={cfs13};
        subs_z(8)={cfs14};
%         temptree = write(wpt_vz,'cfs',3,cfs3,'cfs',4,cfs4,'cfs',5,cfs5,'cfs',6,cfs6);
%         wavez=wprec(temptree);
    end