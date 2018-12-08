CREATE TABLE IF NOT EXISTS "__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL,
    CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId")
);

CREATE TABLE "Blogs" (
    "BlogId" integer NOT NULL,
    "Url" text NULL,
    CONSTRAINT "PK_Blogs" PRIMARY KEY ("BlogId")
);

CREATE TABLE "Posts" (
    "PostId" integer NOT NULL,
    "Title" text NULL,
    "Content" text NULL,
    "BlogId" integer NOT NULL,
    CONSTRAINT "PK_Posts" PRIMARY KEY ("PostId"),
    CONSTRAINT "FK_Posts_Blogs_BlogId" FOREIGN KEY ("BlogId") REFERENCES "Blogs" ("BlogId") ON DELETE CASCADE
);

CREATE INDEX "IX_Posts_BlogId" ON "Posts" ("BlogId");

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20181208175929_Initialize', '2.1.4-rtm-31024');

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20181208181245_npgsql identity onmodelcreating override', '2.1.4-rtm-31024');

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20181208181418_postgresql database', '2.1.4-rtm-31024');

