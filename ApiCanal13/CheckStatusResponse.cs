using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ApiCanal13
{
    public class CheckStatusResponse
    {
        public share_link share_link;
        public author author;
        public signal signal;
        public string created_at;
        public string timestampStart;
        public string timestampEnd;
        public bool share;
        public int views;
        public bool download;
        public bool active;
        public string output;
        public string fileid;
        public bool processing;
        public bool finished;
        public string _id;
        public int __v;
    }

    public class share_link
    {
        public string permalink;
        public string valid_until;
    }

    public class author
    {
        public string role;
        public bool allowsGmail;
        public bool active;
        public string _id;
        public string name;
        public string lastName;
        public string phoneNumber;
        public string email;
        public string updated_at;
        public string created_at;
        public int __v;
    }

    public class signal
    {
        public string logo;
        public int order;
        public string[] crops;
        public bool active;
        public bool deleted;
        public string _id;
        public string name;
        public string idRating;
        public string color;
        public string colorBorde;
        public string ipServer;
        public int __v;
        public string created_at;
        public string updated_at;
    }
}
