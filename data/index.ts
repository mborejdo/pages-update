import { gitConfigure, gitClone, gitPush } from "https://cdn.jsdelivr.net/gh/mborejdo/profile-update/data/git.ts";
import { move } from "https://deno.land/std@0.129.0/fs/mod.ts";

const { env } = Deno;
const API_TOKEN_GITHUB = env.get("API_TOKEN_GITHUB") || "";
const REPO = env.get("REPO") || "";

const BASEFOLDER = "/github/workspace/data";
const DESTFOLDER = `${BASEFOLDER}/${REPO}`;

/**
 * 
 * @returns 
 */
function moveZola() {
    return new Promise(async (resolve: (value: boolean) => void) => {
        await move(`${BASEFOLDER}/public`, `${DESTFOLDER}/docs`, { overwrite: true });
        //await move(`${BASEFOLDER}/public`, `${DESTFOLDER}/docs`, { overwrite: true });

        resolve(true);
    });
}


await gitConfigure(API_TOKEN_GITHUB);
await gitClone(`https://${API_TOKEN_GITHUB}@github.com/mborejdo/${REPO}.git`, DESTFOLDER);
await moveZola();
await gitPush(DESTFOLDER);